// Move to root directory for project visualizations
cd "~/Desktop/sdpmplus/visualizations"

// Load data set with best fitting LCA results
use dataVizData.dta, clear

drop _merge

// Create day of week indicator
qui: g dow = dow(date)

// Create day of week value labels
la def dow 0 "Sunday" 1 "Monday" 2 "Tuesday" 3 "Wednesday" 4 "Thursday" 	 ///   
			5 "Friday" 6 "Saturday", modify
			
// Label the day of week indicator
la val dow dow

// Create primary key for joint latent class by user
qui: egen eachid = group(userid ugroups session)

// Create a binary indicator to ID distinct user by user group LC by within user LC
qui: egen eachdistinct = tag(eachid)

// Make sure the released version of the source code will be picked up
! cd ~/Desktop/Programs/StataPrograms/b/ && git checkout master

// Discard anything from memory that may have been previously used
discard

// Create new scheme file for graphics
brewscheme, scheme(sdpcapstone) barstyle(paired) barc(12) dotstyle(prgn) 	 ///   
dotc(7) scatstyle(set1) scatc(9) linest(dark2) linec(8) somestyle(accent) 	 ///   
somec(8) areast(dark2) areac(8)

// Switch back to the development versions of the source code
! cd ~/Desktop/Programs/StataPrograms/b/ && git checkout dev

// Add variable label
la var dow `""Day of Week " "When Report was Accessed""'

// Bar graph of days of the week platform accessed by between user groups
gr bar (count) , over(dow) by(ugroups, note("")								 ///   
ti("Latent User Group Activity by Day of Week")) asyvars scheme(sdpcapstone) /// 
legend(rows(2) cols(4)) saving(gph/ugroupDayOfWeek.gph, replace)

// Export the graph to a pdf
qui: gr export pdf/ugroupDayOfWeek.pdf, as(pdf) replace

// Bar graph of days of the week platform accessed by within user groups
gr bar (count) , over(dow) by(session, note("")								 ///   
ti("Latent Session Type Activity by Day of Week")) asyvars 					 /// 
legend(rows(2) cols(4)) saving(gph/sessionDayOfWeek.gph, replace) 			 ///   
scheme(sdpcapstone)

// Export the graph to a pdf
qui: gr export pdf/sessionDayOfWeek.pdf, as(pdf) replace

// Bar graph of days of the week platform accessed by joint latent classes
gr bar (count) , over(dow) by(mlcjoint, note("")							 ///   
ti("Joint Within/Between User Latent Classes by Day of Week")) asyvars 		 /// 
legend(rows(2) cols(4)) scheme(sdpcapstone)									 ///   
saving(gph/mlcjointDayOfWeek.gph, replace)

// Export the graph to a pdf
qui: gr export pdf/mlcjointDayOfWeek.pdf, as(pdf) replace

// Bar graph of hours of the day platform accessed by between user groups
gr bar (count) , over(hour, label(angle(45))) by(ugroups, note("")			 ///   
ti("Latent User Group Activity by Hour of the Day"))						 ///   
scheme(sdpcapstone) legend(rows(2) cols(4))									 ///   
saving(gph/ugroupHourOfDay.gph, replace) blabel(bar, size(vsmall) 			 ///   
orient(vertical))

// Export graph to pdf
qui: gr export pdf/ugroupHourOfDay.pdf, as(pdf) replace

// Bar graph of hours of the day platform accessed by within user groups
gr bar (count) , over(hour, label(angle(45))) by(session, note("")			 ///   
ti("Latent Session Type Activity by Hour of the Day")) 		 				 /// 
legend(rows(2) cols(4)) saving(gph/sessionHourOfDay.gph, replace) 			 ///   
scheme(sdpcapstone) blabel(bar, size(vsmall) orient(vertical))

// Export graph to pdf
qui: gr export pdf/sessionHourOfDay.pdf, as(pdf) replace

// Mosaic plot of reports by between user groups
spineplot reportcat ugroups, xlab(, labsize(small) 							 ///   
angle(90) axis(2)) scheme(sdpcapstone) legend(cols(3) rows(5) pos(12) 		 ///   
size(vsmall)) ti("Proportion of Reports Viewed" "vs"						 ///   
"Proportion of Membership in Between User Latent Classes") 					 ///   
saving(gph/ugroupsByReportTypes.gph, replace)

// Export graph to pdf
qui: gr export pdf/ugroupsByReportTypes.pdf, as(pdf) replace

// Mosaic plot of reports by within user groups
spineplot reportcat session, xlab(, labsize(small) 							 ///   
angle(90) axis(2)) scheme(sdpcapstone) legend(cols(3) rows(5) pos(12) 		 ///   
size(vsmall)) ti("Proportion of Reports Viewed" "vs"						 ///   
"Proportion of Membership in Within User Latent Classes") 					 ///   
saving(gph/sessionByReportTypes.gph, replace)

// Export graph to pdf
qui: gr export pdf/sessionByReportTypes.pdf, as(pdf) replace

// Mosaic plot of reports by joint within/between user groups
spineplot reportcat mlcjoint, xlab(, labsize(small) 						 ///   
angle(90) axis(2)) scheme(sdpcapstone) legend(cols(3) rows(5) pos(12) 		 ///   
size(vsmall)) ti("Proportion of Reports Viewed" "vs"						 ///   
"Proportion of Membership in Joint Between/Within User Latent Classes") 	 ///   
saving(gph/mlcjointByReportTypes.gph, replace)

// Export graph to pdf
qui: gr export pdf/mlcjointByReportTypes.pdf, as(pdf) replace

// Mosaic plot of reports by schoolsite
spineplot reportcat schid, xlab(none, axis(2)) scheme(sdpcapstone) 			 ///   
legend(rows(5) size(vsmall) pos(12))										 ///   
saving(gph/reportsBySchool.gph, replace)									 ///   
ti("Report View Diversity by School Site", span)

// Export graph to pdf
qui: gr export pdf/reportsBySchool.pdf, as(pdf) replace

// Mosaic plot of reports by job function
spineplot reportcat function, xlab(none, axis(2)) scheme(sdpcapstone) 		 ///   
legend(rows(5) size(vsmall) pos(12))										 ///   
saving(gph/reportsBySchool.gph, replace)									 ///   
ti("Report View Diversity by Job Type", span)

// Export graph to pdf
qui: gr export pdf/reportsByJobType.pdf, as(pdf) replace

// Box plot of total days by latent classes
gr box totdays, over(session) over(ugroups, gap(*3.75)) scheme(sdpcapstone)  ///   
asyvars legend(ti("Within Subjects Latent Classes")) 						 ///   
ti("Distribution of Total # of Days Accessed"								 ///   
"Across Joint Distributed Latent Classes")									 ///   
saving(gph/totalDaysByLatentClasses.gph, replace)

// Export graph to pdf
qui: gr export pdf/totalDaysByLatentClasses.pdf, as(pdf) replace

// Box plot of daily total report views by latent classes
gr box daytotal, over(session) over(ugroups, gap(*3.75)) scheme(sdpcapstone) ///   
asyvars legend(ti("Within Subjects Latent Classes")) 						 ///   
ti("Distribution of Daily Total Reports Accessed"							 ///  
"Across Joint Distributed Latent Classes") noout medtype(line)				 ///   
saving(gph/dailyTotalsByLatentClasses.gph, replace)

// Export graph to pdf
qui: gr export pdf/dailyTotalsByLatentClasses.pdf, as(pdf) replace

// Box plot of overall total report views by latent classes
gr box ovtotal, over(session) over(ugroups, gap(*3.75)) scheme(sdpcapstone) ///   
asyvars legend(ti("Within Subjects Latent Classes")) 						 ///   
ti("Distribution of Overall Total Reports Accessed"							 ///  
"Across Joint Distributed Latent Classes") noout medtype(line)				 ///   
saving(gph/overallTotalsByLatentClasses.gph, replace)

// Export graph to pdf
qui: gr export pdf/overallTotalsByLatentClasses.pdf, as(pdf) replace

// Mosaic plot of job function by between user groups
spineplot function ugroups, scheme(sdpcapstone) legend(rows(2) size(vsmall)	 ///   
pos(12)) ti("Between User Latent Classes by Job Type", span) 				 ///   
saving(gph/betweenGroupsByJob.gph, replace)

// Export graph to pdf
qui: gr export pdf/betweenGroupsByJob.pdf, as(pdf) replace

// Mosaic plot of job function by within user groups
spineplot function session, scheme(sdpcapstone) legend(rows(2) size(vsmall)	 ///   
pos(12)) ti("Within User Latent Classes by Job Type", span) 				 ///   
saving(gph/betweenGroupsByJob.gph, replace)

// Export graph to pdf
qui: gr export pdf/betweenGroupsByJob.pdf, as(pdf) replace

// Mosaic Plot of job function by school site
spineplot function schid, xlabel(none, axis(2)) legend(pos(12) rows(2) 		 ///   
size(vsmall)) scheme(sdpcapstone) saving(gph/jobBySchool.gph, replace)		 ///   
ti("Distribution of Job Types Across School Sites")

// Export to PDF
qui: gr export pdf/jobBySchool.pdf, as(pdf) replace

// Contour plot of day of week by hour of day platform accessed for each of the
// groups.
tw contour mlcjoint dow hour, levels(24) minmax crule(linear) 				 ///   
scolor(orange) ecolor(purple) ysca(range(0(1)6)) xsca(range(1(1)21)) 		 ///   
xlab(1(1)21) ylab(0 "Sunday" 1 "Monday" 2 "Tuesday"	3 "Wednesday" 			 ///   
4 "Thursday" 5 "Friday" 6 "Saturday", angle(0) nogrid) graphr(lc(white) 	 ///   
fc(white) ic(white)) plotr(lc(white) fc(white) ic(white))					 ///   
yti("") zti("Joint Latent Class" "Within & Between Users Groups")			 ///   
ti("Contours of Day of Week by Hour of Day"									 ///   
"Joint Distribution of Within/Between Latent Classes Mapped to Colors",		 ///   
span size(medlarge) c(black)) heatmap saving(gph/accessContours.gph, ///   
replace)

// Export to pdf
qui: gr export pdf/accessContours.pdf, as(pdf) replace

// Generate a number of distinct within user classes for each user
egen wthinclass = nvals(session), by(userid)

// Preserve the original data
preserve

// Create a constant to generate counts/totals
g x = 1

// Count records by school id and joint latent class IDs
collapse (count) counter = x, by(schid mlcjoint)

// Create a heatmap showing the diversity of joint latent classes by school
tw contour counter mlcjoint schid if !mi(mlcjoint) & counter <= 125, heatmap ///   
crule(intensity) ecolor(green) ccuts(0 5 10 20 30 40 50 60 70 80 90 100 125) ///   
minmax ysca(range(1(1)25)) ylab(#25, labsize(small) angle(0) nogrid) 		 ///   
yti("Joint Within/Between User Latent Class") xsca(range(1(1)62)) xlab(#62,  ///   
labsize(vsmall) angle(90)) zti("# of Reports Viewed by User/Session Type") 	 ///   
ysize(11) xsize(17) graphr(ic(white) fc(white) lc(white)) plotr(ic(white) 	 ///   
fc(white) lc(white)) ti("Diversity of User/Session Types within Schools", 	 ///   
span pos(12) c(black)) note("Only includes cells with n-sizes in [0, 126).", ///   
c(black) pos(7) size(vsmall)) saving(gph/schoolDiversity.gph, replace)

// Export the graph to PDF
qui: gr export pdf/schoolDiversity.pdf, as(pdf) replace

restore, preserve

// Create summary stats for within & between user classes
foreach v of var elapse* hour daytotal ovtotal totdays {

	estpost tabstat `v', by(session) not c(s) s(n mean sd)
	estpost tabstat `v', by(ugroups) not c(s) s(n mean sd)
	
}


