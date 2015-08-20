/* Create a seconds elapsed variable by taking the first difference in request 
time within users and within the same day (e.g., won't calculate seconds elapsed 
between days but will calculate all of the seconds elapsed between first and 
last logins. */
qui: bysort userid date (reqtime): g elapses = reqtime - reqtime[_n - 1] if  ///   
date[_n] == date[_n-1]

// Aggregates the seconds elapsed indicator to minutes elapsed
qui: g elapsem = minutes(elapses)

// And then again to hours elapsed
qui: g elapseh = hours(elapses)

/* Creates a within day sequence ID for the order with which the reports were 
viewed.  The variable is indexed at 0 instead of 1 to facilitate interpretation 
of model intercepts if used in mixed effects models (e.g., intercept would show 
the average outcome based on the first viewing. 
A second sequence ID is generated for the user overall.  */
bysort userid date (reqtime): g dayorder = _n -1
bysort userid (reqtime): g ovorder = _n -1

// Daily and overall total view variables are created here
bysort userid date (reqtime): g daytotal = _N
bysort userid: g ovtotal = _N

// To get the total number of days visited we need to ID unique user/date pairs
egen dayvisit = tag(userid date)
la def dayvisit 0 "Not Visited" 1 "Visited", modify
la val dayvisit dayvisit

/* The indicator above (creates a vector of 0s and 1s) is then summed within 
users to generate a total days accessed variable. */
bys userid: egen totdays = total(dayvisit)

// Stata doesn't have a time only representation, so a string version of the 
// time is created
tostring hour minute second, replace format("%02.0f")
egen time = concat(hour minute second), p(":")

// Then the variables are restored to being numeric
destring hour minute second, replace

// Change the display formatting of the timestamp variable
format reqtime %tcCCYY/NN/DD_HH:MM:SS

// Keep only the variables needed 
keep userid fullnm reqtime weekday month weekyr time date dayvisit totdays	 ///   
dayorder daytotal repo*	elapsem elapses elapseh emailmerge julday hour 		 ///   
minute second jobtitle function ovorder ovtotal schid school schnm

// Create a numeric variable with the fine grained report names
encode report_type_description, gen(report)

// The user's name is transformed into a numeric value with labels attached to 
// identify each of the users
encode fullnm, gen(username)

// Set first observation of day/overall to have the index of 0 instead of 1
qui: replace dayorder = 0 if emailmerge == 2
qui: replace ovorder = 0 if emailmerge == 2

// Set time elapsed, order, total, and report indicators to 0 for staff that did 
// not use the system or if the datum is missing
foreach v of var elapse* *order *total totdays repo? repo?? report reportcat ///   
reportclass{
	replace `v' = 0 if emailmerge == 2 | mi(`v')
}

// Sort the data based on user id
qui: sort userid

// Get the highest value for the job function variable for each user
qui: by userid: egen x = max(function)

// Use that value for the user's entire record
qui: replace function = x

// Drop the maximum value of job function variable
drop x

// Generate indicator variables for each job function type
qui: ta function, gen(func)

// Create indicators for educational level for classroom educators
qui: g eseduc = cond(substr(jobtitle, 1, 5) == "ELEM_" & function == 7, 1, 0)
qui: g hseduc = cond(substr(jobtitle, 1, 3) == "HS_" & function == 7, 1, 0)
qui: g mseduc = cond(substr(jobtitle, 1, 4) == "MID_" & function == 7, 1, 0)

// Loop over educational level indicators
foreach v of var eseduc hseduc mseduc {
	
	// Get number of values for indicators per person
	qui: bys userid: egen valjobs = nvals(`v')
	
	// Creates indicator if they ever taught at that level in the year
	qui: bys userid: egen x = max(`v') if valjobs > 1
	
	// Sets the education level for the user's entire record
	qui: replace `v' = x if valjobs > 1
	
	// Drop the max value variable
	qui: drop x valjobs

} // End of Loop over educational instruction levels


// Creates a primary key variable for all records in the data set
g primkey = _n

/* Use simple K-Means Clustering to show one of the problems is that it does not 
decompose the within and between subjects variance components when classifying 
observations (e.g., no classification of the session interaction and no class-
ification of the users based on session interactions). */
forv i = 2/14 {
	
	// Try clusters for 2 through 14 groups using these variables.
	// At > 14 groups, Stata could not partition the data furter due to ties and 
	// errored out.
	cluster kmeans repo1 repo2 repo3 repo4 repo5 repo6 repo7 repo8 repo9 	 ///   
	repo10 repo11 repo12 repo13 eseduc mseduc hseduc totdays ovtotal, k(`i') ///   
	gen(repocl`i')
	
	// Label each cluster variable
	la var repocl`i' "Reports, total days, and total views K-Means `i' Clusters"
}

// Then remove the character version of the variable
drop dayvisit

// Optimize the storage of the data prior to saving
compress

// Save a version of the file with the school variable in it
qui: saveold  data/fullDataSetWithSchoolString.dta, replace v(13)

// Drop the school variable to make the rest of the files consistent
drop school schnm
