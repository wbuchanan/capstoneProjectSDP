// Add variable labels to the variables in the data set
la var report_type_description "Description of Report Accessed by User"
la var reqtime "System Timestamp"
la var reportclass "Description of Report Accessed by User"
la var hour "Hour of Day"
la var minute "Minute of Hour"
la var second "Second of Minute"
la var julday "Julian Calendar Day"
la var weekyr "Week of Year"
la var elapses "Seconds Elapsed within Session"
la var elapsem "Minutes Elapsed within Session"
la var elapseh "Hours Elapsed within Session"
la var dayorder "Session Sequence ID"
la var daytotal "Total # of Reports for Day"
la var ovorder "Overall Sequence ID"
la var ovtotal "Overall total # of Reports Viewed"
la var time "Timestamp"
la var fullnm "Full Name of User"
la var function "Job Function of User"
la var userid "User ID"
la var date "Date"
la var weekday "Day of Week (text)"
la var month "Month of Year (text)"
la var username "User ID w/Email Address Labels"
la var totdays "Total Days with data viewed"
la var schid "School of Employment"
la var eseduc "Elementary School Educator"
la var mseduc "Middle School Educator"
la var hseduc "High School Educator"
la var primkey "Primary Key for all Records in File"
la var jobtitle "Full Job Title"
la var emailmerge "Indicator from full outer join of usage and directory data"

// Get the names of all variables but schid
qui: ds schid, not

// Sort the data based on these variables
order `r(varlist)' schid

// Create dataset documentation
log using ~/Desktop/sdpmplus/documentation/codebook.txt, replace text

// Generate codebook for data set
codebook, all d

// Close codebook file
log c _all

// Create dataset file specification
log using ~/Desktop/sdpmplus/documentation/fileSpecification.txt, replace text

// Print file specification/details
desc, f

// Close file specification log file
log c _all

// Create a checksum for the data set
datasignature set, saving(~/Desktop/sdpmplus/documentation/checksum.txt, replace)

// Save all the variables in the data set
saveold ~/Desktop/sdpmplus/data/fulldataset.dta, v(13) replace

// Drop the cluster variables
qui: drop repocl*

// Save a slightly smaller sized data set for use in Mplus
saveold ~/Desktop/sdpmplus/data/dataformplus.dta, v(13) replace
