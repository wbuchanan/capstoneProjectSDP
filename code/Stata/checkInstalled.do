// Check for distinct program
cap which distinct

// If not installed install it
if _rc != 0 {

	// Install package
	qui: net install dm0042_1.pkg
	
} // End IF Block to check for distinct program

// Check for distinct program
cap which stcmd

// If not installed install it
if _rc != 0 {

	// Install package
	qui: net install stcmd
	
	/* If using a Mac and StatTransfer13 you can use the line below to create a 
	sym link to the shell executable to call the program from Stata with the 
	stcmd program installed above:
	
	sudo ln -s																   \
			/Applications/StatTransfer13/StatTransfer.app/Contents/MacOS/st	   \ 
			/usr/bin/st	
			
	This also takes care of making sure the command line interface (CLI) is 
	available on your system's path.
	
	*/
	
} // End IF Block to check for distinct program


