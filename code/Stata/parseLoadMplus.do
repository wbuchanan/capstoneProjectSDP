loc root "~/Desktop/sdpmplus/output"
loc alls2cv	 	"allusers/singlelevel/classes2/cv/data"
loc alls2ncv 	"allusers/singlelevel/classes2/nocv/data"
loc alls3cv	 	"allusers/singlelevel/classes3/cv/data"
loc alls3ncv 	"allusers/singlelevel/classes3/nocv/data"
loc alls4cv	 	"allusers/singlelevel/classes4/cv/data"
loc alls4ncv 	"allusers/singlelevel/classes4/nocv/data"
loc alls5cv	 	"allusers/singlelevel/classes5/cv/data"
loc alls5ncv 	"allusers/singlelevel/classes5/nocv/data"
loc allt2cv	 	"allusers/twolevel/classes2/cv/data"
loc allt2ncv 	"allusers/twolevel/classes2/nocv/data"
loc allt3cv	 	"allusers/twolevel/classes3/cv/data"
loc allt3ncv 	"allusers/twolevel/classes3/nocv/data"
loc allt4cv	 	"allusers/twolevel/classes4/cv/data"
loc allt4ncv 	"allusers/twolevel/classes4/nocv/data"
loc allt5cv	 	"allusers/twolevel/classes5/cv/data"
loc allt5ncv 	"allusers/twolevel/classes5/nocv/data"
loc users2cv	"usersonly/singlelevel/classes2/cv/data"
loc users2ncv 	"usersonly/singlelevel/classes2/nocv/data"
loc users3cv	"usersonly/singlelevel/classes3/cv/data"
loc users3ncv 	"usersonly/singlelevel/classes3/nocv/data"
loc users4cv	"usersonly/singlelevel/classes4/cv/data"
loc users4ncv 	"usersonly/singlelevel/classes4/nocv/data"
loc users5cv	"usersonly/singlelevel/classes5/cv/data"
loc users5ncv 	"usersonly/singlelevel/classes5/nocv/data"
loc usert2cv	"usersonly/twolevel/classes2/cv/data"
loc usert2ncv 	"usersonly/twolevel/classes2/nocv/data"
loc usert3cv	"usersonly/twolevel/classes3/cv/data"
loc usert3ncv 	"usersonly/twolevel/classes3/nocv/data"
loc usert4cv	"usersonly/twolevel/classes4/cv/data"
loc usert4ncv 	"usersonly/twolevel/classes4/nocv/data"
loc usert5cv	"usersonly/twolevel/classes5/cv/data"
loc usert5ncv 	"usersonly/twolevel/classes5/nocv/data"

// Store the names of the local macros with the file paths in a local macro
loc files alls2cv alls2ncv alls3cv alls3ncv alls4cv alls4ncv alls5cv		 ///   
alls5ncv users2cv users2ncv users3cv users3ncv users4cv users4ncv users5cv	 ///   
users5ncv allt2cv allt2ncv allt3cv allt3ncv allt4cv allt4ncv allt5cv		 ///   
allt5ncv usert2cv usert2ncv usert3cv usert3ncv usert4cv usert4ncv usert5cv	 ///   
usert5ncv

loc filenum = `: word count `files''

// Store the stable variable list for all of the single-level all user models w/covariates
loc allbasecvs REPO1 REPO2 REPO3 REPO4 REPO5 REPO6 REPO7 REPO8 REPO9 REPO10	 ///   
REPO11 REPO12 REPO13 TOTDAYS ESEDUC HSEDUC MSEDUC FUNC5 PRIMKEY REQTIME		 ///   
REPORTCL REPORTCA FUNCTION EMAILMER USERID DATE MONTH HOUR MINUTE SECOND 	 ///   
WEEKDAY	JULDAY WEEKYR ELAPSES ELAPSEM ELAPSEH DAYORDER OVORDER DAYTOTAL 	 ///   
OVTOTAL	REPORT USERNAME FUNC1 FUNC2 FUNC3 FUNC4 FUNC6 FUNC7 SCHID 

// Create local macros for each of the files with all of the variable names
loc alls2cv_var `allbasecvs' OUTLOGL CPROB1 CPROB2 UGROUPS
loc alls3cv_var `allbasecvs' OUTLOGL CPROB1 CPROB2 CPROB3 UGROUPS
loc alls4cv_var `allbasecvs' OUTLOGL CPROB1 CPROB2 CPROB3 CPROB4 UGROUPS
loc alls5cv_var `allbasecvs' OUTLOGL CPROB1 CPROB2 CPROB3 CPROB4 CPROB5 UGROUPS
loc users2cv_var `allbasecvs' OUTLOGL CPROB1 CPROB2 UGROUPS
loc users3cv_var `allbasecvs' OUTLOGL CPROB1 CPROB2 CPROB3 UGROUPS
loc users4cv_var `allbasecvs' OUTLOGL CPROB1 CPROB2 CPROB3 CPROB4 UGROUPS
loc users5cv_var `allbasecvs' OUTLOGL CPROB1 CPROB2 CPROB3 CPROB4 CPROB5 UGROUPS


// Store the stable variable list for all of the single-level all user models w/o covariates
loc allbasenocv REPO1 REPO2 REPO3 REPO4 REPO5 REPO6 REPO7 REPO8 REPO9 REPO10 ///   
REPO11 REPO12 REPO13 PRIMKEY REQTIME REPORTCL REPORTCA FUNCTION EMAILMER 	 ///   
USERID DATE MONTH HOUR MINUTE SECOND WEEKDAY JULDAY WEEKYR ELAPSES ELAPSEM 	 ///   
ELAPSEH DAYORDER OVORDER DAYTOTAL OVTOTAL TOTDAYS REPORT USERNAME FUNC1 	 ///   
FUNC2 FUNC3 FUNC4 FUNC5 FUNC6 FUNC7 ESEDUC HSEDUC MSEDUC SCHID 

// Create local macros for each of the files with all of the variable names
loc alls2ncv_var `allbasenocv' OUTLOGL CPROB1 CPROB2 UGROUPS
loc alls3ncv_var `allbasenocv' OUTLOGL CPROB1 CPROB2 CPROB3 UGROUPS
loc alls4ncv_var `allbasenocv' OUTLOGL CPROB1 CPROB2 CPROB3 CPROB4 UGROUPS
loc alls5ncv_var `allbasenocv' OUTLOGL CPROB1 CPROB2 CPROB3 CPROB4 CPROB5 UGROUPS
loc users2ncv_var `allbasenocv' OUTLOGL CPROB1 CPROB2 UGROUPS
loc users3ncv_var `allbasenocv' OUTLOGL CPROB1 CPROB2 CPROB3 UGROUPS
loc users4ncv_var `allbasenocv' OUTLOGL CPROB1 CPROB2 CPROB3 CPROB4 UGROUPS
loc users5ncv_var `allbasenocv' OUTLOGL CPROB1 CPROB2 CPROB3 CPROB4 CPROB5 UGROUPS

// All staff two level with covariates and 2 within subjects classes
loc allt2cv_var REPO1 REPO2 REPO3 REPO4 REPO5 REPO6 REPO7 REPO8 REPO9 REPO10 ///   
REPO11 REPO12 REPO13 FUNC7 TOTDAYS FUNC6 FUNC4 PRIMKEY REQTIME REPORTCL 	 ///   
REPORTCA FUNCTION EMAILMER DATE MONTH HOUR MINUTE SECOND WEEKDAY JULDAY 	 ///   
WEEKYR ELAPSES ELAPSEM ELAPSEH DAYORDER OVORDER DAYTOTAL OVTOTAL REPORT 	 ///   
USERNAME FUNC1 FUNC2 FUNC3 FUNC5 HSEDUC MSEDUC SCHID ESEDUC UGROUPS1 		 ///   
UGROUPS2 UGROUPS3 UGROUPS4 SESSION1 C_UGROUPS1 C_UGROUPS2 C_UGROUPS3 		 ///   
C_UGROUPS4 C_SESSION1 OUTLOGL CPROB1 CPROB2 CPROB3 CPROB4 CPROB5 CPROB6 	 ///   
CPROB7 CPROB8 CPROB9 CPROB10 UGROUPS SESSION MLCJOINT USERID

// All staff two level with covariates and 3 within subjects classes 
loc allt3cv_var REPO1 REPO2 REPO3 REPO4 REPO5 REPO6 REPO7 REPO8 REPO9 REPO10 ///   
REPO11 REPO12 REPO13 TOTDAYS FUNC6 ESEDUC MSEDUC HSEDUC PRIMKEY REQTIME 	 ///   
REPORTCL REPORTCA FUNCTION EMAILMER DATE MONTH HOUR MINUTE SECOND WEEKDAY 	 ///   
JULDAY WEEKYR ELAPSES ELAPSEM ELAPSEH DAYORDER OVORDER DAYTOTAL OVTOTAL 	 ///   
REPORT USERNAME FUNC1 FUNC2 FUNC3 FUNC4 FUNC5 FUNC7 SCHID UGROUPS1 UGROUPS2  ///   
UGROUPS3 UGROUPS4 SESSION1 SESSION2 C_UGROUPS1 C_UGROUPS2 C_UGROUPS3 		 ///   
C_UGROUPS4 C_SESSION1 C_SESSION2 OUTLOGL CPROB1 CPROB2 CPROB3 CPROB4 CPROB5  ///   
CPROB6 CPROB7 CPROB8 CPROB9 CPROB10 CPROB11 CPROB12 CPROB13 CPROB14 CPROB15  ///   
UGROUPS SESSION MLCJOINT USERID

// All staff two level with covariates and 4 within subjects classes
loc allt4cv_var REPO1 REPO2 REPO3 REPO4 REPO5 REPO6 REPO7 REPO8 REPO9 REPO10 ///   
REPO11 REPO12 REPO13 TOTDAYS ESEDUC HSEDUC MSEDUC FUNC4 FUNC6 PRIMKEY 		 ///   
REQTIME REPORTCL REPORTCA FUNCTION EMAILMER DATE MONTH HOUR MINUTE SECOND 	 ///   
WEEKDAY JULDAY WEEKYR ELAPSES ELAPSEM ELAPSEH DAYORDER OVORDER DAYTOTAL 	 ///   
OVTOTAL REPORT USERNAME FUNC1 FUNC2 FUNC3 FUNC5 FUNC7 SCHID UGROUPS1 		 ///   
UGROUPS2 UGROUPS3 UGROUPS4 SESSION1 SESSION2 SESSION3 C_UGROUPS1 C_UGROUPS2  ///   
C_UGROUPS3 C_UGROUPS4 C_SESSION1 C_SESSION2 C_SESSION3 OUTLOGL CPROB1 CPROB2 ///   
CPROB3 CPROB4 CPROB5 CPROB6 CPROB7 CPROB8 CPROB9 CPROB10 CPROB11 CPROB12 	 ///   
CPROB13 CPROB14 CPROB15 CPROB16 CPROB17 CPROB18 CPROB19 CPROB20 UGROUPS 	 ///   
SESSION MLCJOINT USERID

// All staff two level with covariates and 5 within subjects classes
loc allt5cv_var REPO1 REPO2 REPO3 REPO4 REPO5 REPO6 REPO7 REPO8 REPO9 REPO10 ///   
REPO11 REPO12 REPO13 TOTDAYS ESEDUC HSEDUC MSEDUC FUNC6 PRIMKEY REQTIME 	 ///   
REPORTCL REPORTCA FUNCTION EMAILMER DATE MONTH HOUR MINUTE SECOND WEEKDAY 	 ///   
JULDAY WEEKYR ELAPSES ELAPSEM ELAPSEH DAYORDER OVORDER DAYTOTAL OVTOTAL 	 ///   
REPORT USERNAME FUNC1 FUNC2 FUNC3 FUNC5 FUNC7 SCHID FUNC4 UGROUPS1 UGROUPS2  ///   
UGROUPS3 UGROUPS4 SESSION1 SESSION2 SESSION3 SESSION4 C_UGROUPS1 C_UGROUPS2  ///   
C_UGROUPS3 C_UGROUPS4 C_SESSION1 C_SESSION2 C_SESSION3 C_SESSION4 OUTLOGL 	 ///   
CPROB1 CPROB2 CPROB3 CPROB4 CPROB5 CPROB6 CPROB7 CPROB8 CPROB9 CPROB10 		 ///   
CPROB11 CPROB12 CPROB13 CPROB14 CPROB15 CPROB16 CPROB17 CPROB18 CPROB19 	 ///   
CPROB20 CPROB21 CPROB22 CPROB23 CPROB24 CPROB25 UGROUPS SESSION MLCJOINT USERID

// All staff two level w/o covariates and 2 within subjects classes
loc allt2ncv_var REPO1 REPO2 REPO3 REPO4 REPO5 REPO6 REPO7 REPO8 REPO9 		 ///   
REPO10 REPO11 REPO12 REPO13 PRIMKEY REQTIME REPORTCL REPORTCA FUNCTION 		 ///   
EMAILMER DATE MONTH HOUR MINUTE SECOND WEEKDAY JULDAY WEEKYR ELAPSES ELAPSEM ///   
ELAPSEH DAYORDER OVORDER DAYTOTAL OVTOTAL TOTDAYS REPORT USERNAME FUNC1 	 ///   
FUNC2 FUNC3 FUNC4 FUNC5 FUNC6 FUNC7 ESEDUC HSEDUC MSEDUC SCHID UGROUPS1 	 ///   
UGROUPS2 UGROUPS3 UGROUPS4 SESSION1 C_UGROUPS1 C_UGROUPS2 C_UGROUPS3 		 ///   
C_UGROUPS4 C_SESSION1 OUTLOGL CPROB1 CPROB2 CPROB3 CPROB4 CPROB5 CPROB6 	 ///   
CPROB7 CPROB8 CPROB9 CPROB10 UGROUPS SESSION MLCJOINT USERID

// All staff two level w/o covariates and 3 within subjects classes
loc allt3ncv_var REPO1 REPO2 REPO3 REPO4 REPO5 REPO6 REPO7 REPO8 REPO9 		 ///   
REPO10 REPO11 REPO12 REPO13 PRIMKEY REQTIME REPORTCL REPORTCA FUNCTION 		 ///   
EMAILMER DATE MONTH HOUR MINUTE SECOND WEEKDAY JULDAY WEEKYR ELAPSES ELAPSEM ///   
ELAPSEH DAYORDER OVORDER DAYTOTAL OVTOTAL TOTDAYS REPORT USERNAME FUNC1 	 ///   
FUNC2 FUNC3 FUNC4 FUNC5 FUNC6 FUNC7 ESEDUC HSEDUC MSEDUC SCHID UGROUPS1 	 ///   
UGROUPS2 UGROUPS3 UGROUPS4 SESSION1 SESSION2 C_UGROUPS1 C_UGROUPS2 			 ///   
C_UGROUPS3 C_UGROUPS4 C_SESSION1 C_SESSION2 OUTLOGL CPROB1 CPROB2 CPROB3 	 ///   
CPROB4 CPROB5 CPROB6 CPROB7 CPROB8 CPROB9 CPROB10 CPROB11 CPROB12 CPROB13 	 ///   
CPROB14 CPROB15 UGROUPS SESSION MLCJOINT USERID

// All staff two level w/o covariates and 4 within subjects classes
loc allt4ncv_var REPO1 REPO2 REPO3 REPO4 REPO5 REPO6 REPO7 REPO8 REPO9 		 ///   
REPO10 REPO11 REPO12 REPO13 PRIMKEY REQTIME REPORTCL REPORTCA FUNCTION 		 ///   
EMAILMER DATE MONTH HOUR MINUTE SECOND WEEKDAY JULDAY WEEKYR ELAPSES ELAPSEM ///   
ELAPSEH DAYORDER OVORDER DAYTOTAL OVTOTAL TOTDAYS REPORT USERNAME FUNC1 	 ///   
FUNC2 FUNC3 FUNC4 FUNC5 FUNC6 FUNC7 ESEDUC HSEDUC MSEDUC SCHID UGROUPS1 	 ///   
UGROUPS2 UGROUPS3 UGROUPS4 SESSION1 SESSION2 SESSION3 C_UGROUPS1 C_UGROUPS2  ///   
C_UGROUPS3 C_UGROUPS4 C_SESSION1 C_SESSION2 C_SESSION3 OUTLOGL CPROB1 CPROB2 ///   
CPROB3 CPROB4 CPROB5 CPROB6 CPROB7 CPROB8 CPROB9 CPROB10 CPROB11 CPROB12 	 ///   
CPROB13 CPROB14 CPROB15 CPROB16 CPROB17 CPROB18 CPROB19 CPROB20 UGROUPS 	 ///   
SESSION MLCJOINT USERID

// All staff two level w/o covariates and 5 within subjects classes
loc allt5ncv_var REPO1 REPO2 REPO3 REPO4 REPO5 REPO6 REPO7 REPO8 REPO9 		 ///   
REPO10 REPO11 REPO12 REPO13 PRIMKEY REQTIME REPORTCL REPORTCA FUNCTION 		 ///   
EMAILMER DATE MONTH HOUR MINUTE SECOND WEEKDAY JULDAY WEEKYR ELAPSES ELAPSEM ///   
ELAPSEH DAYORDER OVORDER DAYTOTAL OVTOTAL TOTDAYS REPORT USERNAME FUNC1 	 ///   
FUNC2 FUNC3 FUNC4 FUNC5 FUNC6 FUNC7 ESEDUC HSEDUC MSEDUC SCHID UGROUPS1 	 ///   
UGROUPS2 UGROUPS3 UGROUPS4 SESSION1 SESSION2 SESSION3 SESSION4 C_UGROUPS1 	 ///   
C_UGROUPS2 C_UGROUPS3 C_UGROUPS4 C_SESSION1 C_SESSION2 C_SESSION3 C_SESSION4 ///   
OUTLOGL CPROB1 CPROB2 CPROB3 CPROB4 CPROB5 CPROB6 CPROB7 CPROB8 CPROB9 		 ///   
CPROB10 CPROB11 CPROB12 CPROB13 CPROB14 CPROB15 CPROB16 CPROB17 CPROB18 	 ///   
CPROB19 CPROB20 CPROB21 CPROB22 CPROB23 CPROB24 CPROB25 UGROUPS SESSION 	 ///   
MLCJOINT USERID

// All of the no-covariate models should translate across users/all staff samples
loc usert2ncv_var `allt2ncv_var'
loc usert3ncv_var `allt3ncv_var'
loc usert4ncv_var `allt4ncv_var'
loc usert5ncv_var `allt5ncv_var'

// Users only with 2 within subjects classes and covariates
loc usert2cv_var REPO1 REPO2 REPO3 REPO4 REPO5 REPO6 REPO7 REPO8 REPO9 	 ///   
REPO10 REPO11 REPO12 REPO13 TOTDAYS ESEDUC HSEDUC MSEDUC FUNC5 PRIMKEY 		 ///   
REQTIME REPORTCL REPORTCA FUNCTION EMAILMER DATE MONTH HOUR MINUTE SECOND 	 ///   
WEEKDAY JULDAY WEEKYR ELAPSES ELAPSEM ELAPSEH DAYORDER OVORDER DAYTOTAL 	 ///   
OVTOTAL REPORT USERNAME FUNC1 FUNC2 FUNC3 FUNC4 FUNC6 FUNC7 SCHID UGROUPS1 	 ///   
UGROUPS2 UGROUPS3 UGROUPS4 SESSION1 C_UGROUPS1 C_UGROUPS2 C_UGROUPS3 		 ///   
C_UGROUPS4 C_SESSION1 OUTLOGL CPROB1 CPROB2 CPROB3 CPROB4 CPROB5 CPROB6 	 ///   
CPROB7 CPROB8 CPROB9 CPROB10 UGROUPS SESSION MLCJOINT USERID

// Users only with 3 within subjects classes and covariates
loc usert3cv_var REPO1 REPO2 REPO3 REPO4 REPO5 REPO6 REPO7 REPO8 REPO9 		 ///   
REPO10 REPO11 REPO12 REPO13 TOTDAYS ESEDUC HSEDUC MSEDUC PRIMKEY REQTIME 	 ///   
REPORTCL REPORTCA FUNCTION EMAILMER DATE MONTH HOUR MINUTE SECOND WEEKDAY 	 ///   
JULDAY WEEKYR ELAPSES ELAPSEM ELAPSEH DAYORDER OVORDER DAYTOTAL OVTOTAL 	 ///   
REPORT USERNAME FUNC1 FUNC2 FUNC3 FUNC4 FUNC6 FUNC5 FUNC7 SCHID UGROUPS1 	 ///   
UGROUPS2 UGROUPS3 UGROUPS4 SESSION1 SESSION2 C_UGROUPS1 C_UGROUPS2 			 ///   
C_UGROUPS3 C_UGROUPS4 C_SESSION1 C_SESSION2 OUTLOGL CPROB1 CPROB2 CPROB3 	 ///   
CPROB4 CPROB5 CPROB6 CPROB7 CPROB8 CPROB9 CPROB10 CPROB11 CPROB12 CPROB13 	 ///   
CPROB14 CPROB15 UGROUPS SESSION MLCJOINT USERID

// Users only with 4 within subjects classes and covariates
loc usert4cv_var REPO1 REPO2 REPO3 REPO4 REPO5 REPO6 REPO7 REPO8 REPO9 		 ///   
REPO10 REPO11 REPO12 REPO13 TOTDAYS ESEDUC HSEDUC MSEDUC PRIMKEY REQTIME 	 ///   
REPORTCL REPORTCA FUNCTION EMAILMER DATE MONTH HOUR MINUTE SECOND WEEKDAY 	 ///   
JULDAY WEEKYR ELAPSES ELAPSEM ELAPSEH DAYORDER OVORDER DAYTOTAL OVTOTAL 	 ///   
REPORT USERNAME FUNC1 FUNC2 FUNC3 FUNC4 FUNC5 FUNC6 FUNC7 SCHID UGROUPS1 	 ///   
UGROUPS2 UGROUPS3 UGROUPS4 SESSION1 SESSION2 SESSION3 C_UGROUPS1 C_UGROUPS2  ///   
C_UGROUPS3 C_UGROUPS4 C_SESSION1 C_SESSION2 C_SESSION3 OUTLOGL CPROB1 CPROB2 ///   
CPROB3 CPROB4 CPROB5 CPROB6 CPROB7 CPROB8 CPROB9 CPROB10 CPROB11 CPROB12 	 ///   
CPROB13 CPROB14 CPROB15 CPROB16 CPROB17 CPROB18 CPROB19 CPROB20 UGROUPS 	 ///   
SESSION MLCJOINT USERID

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

// Loop over files to parse and clean Stata versions of the data
forv i = 1/`filenum' {

	// Get the specific file name from the files local macro
	loc v `: word `i' of `files''
	
	// Read the raw data file into memory
	qui: import delimited using `"`root'/``v''.dat"', case(l) clear 		 ///   
	delim(" ", collapse)

	// Get all variables
	qui: ds
	
	// Rename variables
	qui: rename (`r(varlist)')(v1 ``v'_var')
	
	// Make all names lower cased
	qui: rename *, l
	
	// Drop data from original source file
	qui: drop repo1 repo2 repo3 repo4 repo5 repo6 repo7 repo8 repo9 repo10 	 ///   
	repo11 repo12 repo13 reqtime reportcl reportca function emailmer date 	 ///   
	month hour minute second weekday julday weekyr elapses elapsem elapseh 	 ///   
	dayorder ovorder daytotal ovtotal totdays report username func1 func2 	 ///   
	func3 func4 func5 func6 func7 eseduc hseduc mseduc 
	
	if substr(`"`: type schid'"', 1, 3) == "str" {
		// Make sure missing values of school ID are correctly handled
		qui: replace schid = "" if inlist(schid, "**********", "*")
		// Then recast school ID
		qui: destring schid, replace
	}
	
	if substr(`"`: type userid'"', 1, 3) == "str" {
		qui: replace userid = "" if userid == "**********"
		qui: destring userid, replace
	}
	
	// Now make sure schid is an integer value for the merging
	qui: replace schid = int(schid)
	qui: replace userid = int(userid)

	// Join original data to the results set
	qui: merge 1:1 primkey schid userid using data/fulldataset.dta, gen(resorgmerge)
		
	// Label Variables
	la var ugroups "Estimated Latent Class - User Groups"
	
	// Check for within subjects latent class variable
	cap confirm v session
	
	// If the variable is in the data set
	if _rc == 0 {
		
		// Label the within user latent class variable
		la var session "Estimated Latent Class - Session Types"
		
		// Label the jointly distributed latent class ID
		la var mlcjoint "Estimated Joint Latent Class Membership - Within and Between Subjects Membership"
	
		// Create flags for uniquely identifying records
		qui: egen withinid = tag(userid session)

	} // End IF Block checking for within subjects latent class variable
	
	// Loop over the class membership probability variables
	foreach v of var cprob* {
	
		// Label the variable
		la var `v' `"Probability of Membership in class `: subinstr loc v "cprob" "", all'"'
	
	} // End Loop over class probability variables
	
	// Create ID to use to identify unique between user cases
	qui: egen betweenid = tag(userid ugroups)
	
	// Create a file identifier
	qui: g fileid = `i'
	
	// Define file ID value labels
	la def fileid `i' "`root'/``: word `i' of `files'''.dta", modify
	
	// Apply value labels
	la val fileid fileid
	
	// Optimize storage
	qui: compress
	
	// Save the data back to the directory
	qui: saveold `"`root'/``: word `i' of `files'''.dta"', replace v(13)
	
	// Check iteration
	if `i' == 1 {
	
		// Save base file
		qui: saveold data/allResultsSets.dta, v(13) replace
		
	} // End IF Block for first result set file processed
	
	// For all others
	else {
	
		// Append existing results set file
		qui: append using data/allResultsSets.dta
		
		// Save over file
		qui: saveold data/allResultsSets.dta, replace v(13)
		
	} // End ELSE Block to create single result set file
	
} // End Loop to build Stata versions of the files	

// Loop over files to parse and clean Stata versions of the data
forv i = 1/`filenum' {

	// Get the specific file name from the files local macro
	loc v `: word `i' of `files''

	// Define file ID value labels
	la def fileid `i' "`root'/``: word `i' of `files'''.dta", modify
	
	// Apply value labels
	la val fileid fileid
	
	// Optimize storage
	qui: compress
	
	// Save over file
	qui: saveold data/allResultsSets.dta, replace v(13)
	
} // End Loop to assign value labels in combined result set file 
