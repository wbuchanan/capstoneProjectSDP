// Set random number seed used to generate unique user IDs later
set seed 7779311

// Move to directory where files are stored
cd ~/Desktop/sdpmplus

// Check for required programs installation
qui: do code/Stata/checkInstalled.do

// Clean up the staff directory data
qui: do code/Stata/staffDirectory.do

// Clean up the user activity data file
qui: do code/Stata/userActivityData.do

// Join the two data sets and do some additional data cleansing
qui: do code/Stata/joinClean.do

// Create some additional metrics with the data available
qui: do code/Stata/featureEngineering.do

// Add relevant documentation/metadata to the data file and save data used for
// analysis
qui: do code/Stata/metaSave.do

// Create data set for Mplus
stcmd stata data/dataformplus.dta mplus data/dataformplus.inp -y 

// Check for existing Mplus source code file
cap confirm new file code/Mplus/dataformplus.inp

// If File exists
if _rc != 0 {

	// Remove existing version of the file
	erase code/Mplus/dataformplus.inp
	
} // End IF Block for Mplus source code check

// Move Mplus Syntax file to code subdirectory
copy data/dataformplus.inp code/Mplus/dataformplus.inp

// Delete file in data directory
erase data/dataformplus.inp

// Get rid of unneeded syntax
filefilter code/Mplus/dataformplus.inp code/Mplus/tmp.inp,				 ///   
from("Analysis:") to("")

// Delete file in so it can be recreated
erase code/Mplus/dataformplus.inp

// Rebuild final file
filefilter code/Mplus/tmp.inp code/Mplus/dataformplus.inp, 				 ///   
from("Type = basic;") to("")

// Erase temp file
erase code/Mplus/tmp.inp

/* Execute only after the models have all been fitted to the data */
qui: do code/Stata/parseLoadMplus.do
qui: do code/Stata/stateData.do
qui: do code/Stata/previs.do
qui: do code/Stata/visualize.do



