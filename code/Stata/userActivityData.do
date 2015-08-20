// Load the user activity data
import excel using ~/Downloads/reports_by_user_2.xlsx, first clear

// Remove records generated by the district's NWEA rep (NWEA employee)
qui: drop if username == "SASS_Fayette"

// Replace email address with generic username (also an email address) if the 
// user name variable is missing
qui: replace email_address = username if mi(email_address)

// Make all characters in email address lower cased
qui: replace email_address = lower(email_address)

// Replace embedded spaces with underscores
qui: replace report_type_description = subinstr(report_type_description, " ", "_", .)

// Condense report types
{

// These reports are all aggregated to some level
loc ag1 `""ASG_Class_Report", "Class_By_RIT", "Class_Report""'
loc ag2 `""Class_by_Goal", "Class_by_Projected_Proficiency", "District_Summary""' 
loc ag3 `""MPG_Teacher", "Projected_Proficiency_Summary""'

// Assumption is that these are all student-level reports
loc st1 `""Grade_Report", "MPG_Student", "MPG_Sub-Skill_Performance""'   
loc st2 `""Student_Goal_Setting_Worksheet", "Student_Growth_Summary""'
loc st3 `""Student_Progress_Report""'

// And these are assumed to be more administrative type reports
loc ad1 `""DesCartes_Query", "PGID", "Potential_Duplicate_Profiles""'
loc ad2 `""Profiles_With_Shared_IDs", "Students_Without_Reporting_Attributes""'
loc ad3 `""Students_Without_Valid_Test_Results", "Test_Events_By_Status", "User_Roles""'

// Create a condensed report type variable
qui: g reportclass =														 ///   
			cond(inlist(report_type_description, `ag1', `ag2', `ag3'), 1,	 ///   
			cond(inlist(report_type_description, `st1', `st2', `st3'), 2,	 ///   
			cond(inlist(report_type_description, `ad1', `ad2', `ad3'), 3, .)))

// Generate value labels for the variable
la def reportclass 1 "Aggregate Reports" 2 "Student Level Reports" 3 "Admin Reports"

// Attach the value labels
la val reportclass reportclass	

// Add a variable label
la var reportclass "Report Type Meta Classification"		
			
}

// Clone the finer grained report type variable
clonevar repcat = report_type_description

// Group all of the administrative reports together into a single category
qui: replace repcat = "Admin Reports" if inlist(repcat, `ad1', `ad2', `ad3')

// Group the MPG reports together into a single category
qui: replace repcat = "MPG Reports" if inlist(repcat, "MPG_Student",		 ///   
"MPG_Sub-Skill_Performance", "MPG_Teacher")

// Create a numeric version of the variable with value labels attached
encode repcat, gen(reportcat)

// Get the unique values in it and store them in a local macro
qui: levelsof reportcat, loc(reps)

// Loop over the unique values of the report type variable
foreach v of loc reps {

	// Create an indicator for each variable
	qui: g repo`v' = cond(reportcat == `v', 1, 0)
	
	// Use the value label for the value to include in the variable label
	la var repo`v' `"Report Type = `: label (reportcat) `v''"'
	
} // End of Loop to create indicators for each report type

