// Users only with 5 within subjects classes and covariates
loc usert5cv_var REPO1 REPO2 REPO3 REPO4 REPO5 REPO6 REPO7 REPO8 REPO9		 ///   
REPO10 REPO11 REPO12 REPO13 TOTDAYS ESEDUC HSEDUC MSEDUC PRIMKEY REQTIME	 ///   
REPORTCL REPORTCA FUNCTION EMAILMER DATE MONTH HOUR MINUTE SECOND WEEKDAY	 ///   
JULDAY WEEKYR ELAPSES ELAPSEM ELAPSEH DAYORDER OVORDER DAYTOTAL OVTOTAL		 ///   
REPORT USERNAME FUNC1 FUNC2 FUNC3 FUNC4 FUNC5 FUNC6 FUNC7 SCHID UGROUPS1	 ///   
UGROUPS2 UGROUPS3 UGROUPS4 SESSION1 SESSION2 SESSION3 SESSION4 C_UGROUPS1	 ///   
C_UGROUPS2 C_UGROUPS3 C_UGROUPS4 C_SESSION1 C_SESSION2 C_SESSION3 C_SESSION4 ///   
OUTLOGL CPROB1 CPROB2 CPROB3 CPROB4 CPROB5 CPROB6 CPROB7 CPROB8 CPROB9		 ///   
CPROB10 CPROB11 CPROB12 CPROB13 CPROB14 CPROB15 CPROB16 CPROB17 CPROB18		 ///   
CPROB19 CPROB20 CPROB21 CPROB22 CPROB23 CPROB24 CPROB25 UGROUPS SESSION		 ///   
MLCJOINT USERID

loc root "~/Desktop/sdpmplus/output/usersonly/twolevel/classes5/cv/data"

// Read the raw data file into memory
qui: import delimited using `"`root'.dat"', case(l) clear delim(" ", collapse)

// Get all variables
qui: ds

// Rename variables
qui: rename (`r(varlist)')(v1 `usert5cv_var')

// Make all names lower cased
qui: rename *, l

// Drop data from original source file
qui: drop repo1 repo2 repo3 repo4 repo5 repo6 repo7 repo8 repo9 repo10 	 ///   
repo11 repo12 repo13 reqtime reportcl reportca function emailmer date 	 ///   
month hour minute second weekday julday weekyr elapses elapsem elapseh 	 ///   
dayorder ovorder daytotal ovtotal totdays report username func1 func2 	 ///   
func3 func4 func5 func6 func7 eseduc hseduc mseduc 

replace schid = "" if schid == "*"
destring schid, replace
replace schid = int(schid)

// Join original data to the results set
qui: merge 1:1 primkey schid userid using data/fullDataSetWithSchoolString.dta, ///   
gen(resorgmerge)

// Label Variables
la var ugroups "Estimated Latent Class - User Groups"

// Label the within user latent class variable
la var session "Estimated Latent Class - Session Types"

// Label the jointly distributed latent class ID
la var mlcjoint "Estimated Joint Latent Class Membership - Within and Between Subjects Membership"

// Create flags for uniquely identifying records
qui: egen withinid = tag(userid session)

// Loop over the class membership probability variables
foreach v of var cprob* {

	// Label the variable
	la var `v' `"Probability of Membership in class `: subinstr loc v "cprob" "", all'"'

} // End Loop over class probability variables

// Create ID to use to identify unique between user cases
qui: egen betweenid = tag(userid ugroups)

g fileid = 31

// Optimize storage
qui: compress

qui: saveold `"`root'.dta"', v(13) replace

merge 1:1 primkey schid userid using data/usersWithStateData.dta, gen(statemerge)

saveold visualizations/dataVizData.dta, replace v(13)
