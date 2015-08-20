// Join these data with the personnel directory data
merge m:1 email_address using ~/Desktop/sdpmplus/data/kyemployees.dta, gen(emailmerge) 

// Clean up the username and educator name fields
qui: replace username = email_address if mi(username)
qui: replace last = educator_name_last if mi(last) & !mi(educator_name_last)
qui: replace first = educator_name_first if mi(first) & !mi(educator_name_first)
qui: replace educator_name_last = last if !mi(last) & mi(educator_name_last)
qui: replace educator_name_first = first if !mi(first) & mi(educator_name_first)
foreach v of var username last first educator_name_last educator_name_first {
	qui: replace `v' = trim(itrim(proper(`v')))
	qui: replace `v' = subinstr(`v' , " ", "_", .)
}

// Create fullname variable
qui: egen fullnm = concat(educator_name_first educator_name_last), p("_")

// Drop variables that will not be used in later analyses
drop title repcat 

// For users that exist in the log data but not in the personnel directory, 
// classify their job type as unknown
qui: replace function = 1 if mi(jobtitle)

/* For users in the personnel file without log records, we imputed the report 
indicators with true zeros since the users were not observed accessing the 
report(s) in question.  These values could have also been considered censored, 
but we didn't feel the additional complexity of handling censored data would add 
significant value beyond the assumption that they would not have accessed the 
reports before/after the observation period). */
forv i = 1/`: word count `reps'' {
	
	// If missing a value for a report type indicator set it to 0
	qui: replace repo`i' = 0 if mi(repo`i')
	
} // End Loop to impute report type indicators with true zeros

// Tag all unique email addresses
egen fnm = tag(email_address)

// Count the number of unique email addresses 
qui: count if fnm == 1

// Store the number of unique email addresses
loc uniqemail = r(N)

// Create a random ID for each unique email address
qui: g userid = int(runiform(1000000, 9999999)) if fnm == 1

// Get the unique values of userid 
qui: distinct userid 

// Store number of unique userids
loc uniquid = r(ndistinct)

// Check to make sure there are equal numbers of unique IDs and unique emails
if `uniqemail' != `uniquid' {

	// Repeat ID generation until there are equal number of distinct user IDs
	while `uniqemail' != `uniquid' {

		// Drop the user id variable
		qui: drop userid
		
		// Create a random ID for each unique email address
		qui: g userid = int(runiform(1000000, 9999999)) if fnm == 1

		// Get the unique values of userid 
		qui: distinct userid

		// Store number of unique userids
		loc uniquid = r(ndistinct)

	} // End WHILE Block for unique user ID creation

} // End IF Block for insufficient number of random IDs	
	
// Sort data based on the email tag and email address
gsort email_address - fnm

// Fill in the unique user ids for each user
bys email_address: replace userid = userid[_n - 1] if mi(userid[_n]) & !mi(userid[_n - 1])

// Date only
g date = dofc(request_date)

// Use current date when data is cleaned for observations missing the date
replace date = date(`"`c(current_date)'"', "DMY") if mi(date)

// Do the same for the report time stamp
replace request_date =														 ///   
			`: di clock(`"`c(current_date)'`c(current_time)'"', "DMYhms")'	 ///   
			if mi(request_date)
			
// Rename the request date variable
rename request_date reqtime			

// Numeric month when report was viewed
qui: g month = month(reqtime)

// Numeric year when report was viewed
qui: g year = year(reqtime)

// Numeric hour of the day when report was viewed
qui: g hour = hh(reqtime)

// Numeric minute of the hour when report was viewed
qui: g minute = mm(reqtime)

// Numeric second of the minute when report was viewed
qui: g second = ss(reqtime)

// Set the display formatting for the date variable
format %td date

// Day of the week
qui: g weekday = dow(date)

// Julian Calendar date
qui: g julday = doy(date)

// Week in Year
qui: g weekyr = week(date)

