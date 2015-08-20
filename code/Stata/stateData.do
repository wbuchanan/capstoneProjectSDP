

preserve 
import excel using data/LEARNING_ENVIRONMENT_STUDENTS-TEACHERS.xlsx, ///   
clear first case(l)
keep if dist_name == "Fayette County"
replace sch_name = "CENTRAL OFFICE" if sch_name == "---District Total---"
rename sch_name school
qui: replace school = upper(school)
qui: replace school = trim(itrim(ustrregexra(school, "(FOOD)|(SVC)|(SER.*)|(TRD)|(TRAD.*)|(FS)|(FD)|(SCH$)|(SCHOOL$)|(SCHL)|(MAGNET)", "", 1)))
qui: replace school = ustrregexra(school, "(ELEM$)|(ELEMENTARY)|(ACAD-PRIMARY)", "ES", 1)
qui: replace school = ustrregexra(school, "(MID$)|(MIDDLE$)|(MIDDLE-)|(MID SCHOOL)", "MS", 1)
qui: replace school = ustrregexra(school, "(HIGH$)|(HIGH SCH)", "HS", 1)
qui: replace school = "ATHENS CHILESBURG ES" if school == "ATHENS-CHILESBURG ES"
qui: replace school = "B T WASHINGTON ES" if school == "BOOKER T WASHINGTON PRIMARY ACADEMY"
qui: replace school = "BOOKER T WASHINGTON ACADEMY" if school == "BOOKER T WASHINGTON INTERMEDIATE ACADEMY"
qui: replace school = subinstr(school, ".", "", .)
qui: replace school = "BRYAN STATION MS" if school == "BRYAN STATION"
qui: replace school = "LIBERTY ES" if school == "LIBERTY"
qui: replace school = "MARTIN LUTHER KING ACADEMY" if school == "MARTIN L KING ACAD FOR EXCELLENCE ALT"
qui: replace school = "PAUL LAURENCE DUNBAR HS" if school == "PAUL LAURENCE DUNBAR"
qui: replace school = "SANDERSVILLE ES" if school == "SANDERSVILLE"
qui: replace school = "WELLINGTON ES" if school == "WELLINGTON"
qui: replace school = "WILLIAM WELLS BROWN ES" if school == "WW BROWN"
qui: replace school = "EASTSIDE CENTER FOR APPLD TECH" if school == "EASTSIDE TECHNICAL CENTER"
qui: replace school = "EDYTHE J HAYES MS" if school == "EDYTHE JONES HAYES MS"
qui: replace school = "FAYETTE PRESCHOOL CTR SRV" if school == "FAYETTE COUNTY LEARNING CENTER"
qui: replace school = "LOCUST TRACE TECHNICAL CENTER" if school == "LOCUST TRACE AGRISCIENCE CENTER"
qui: replace school = "MAXWELL ES" if school == "MAXWELL SPANISH IMMERSION ES"
qui: replace school = "SOUTHSIDE CENTER FOR APLD TECH" if school == "SOUTHSIDE TECHNICAL CENTER"
qui: replace school = "THE LEARNING CENTER" if school == "FAYETTE COUNTY LEARNING CENTER"

// Create a cleaned/condensed version of the school name variable
qui: g schnm = subinstr(school, " ", "_", .)

rename (avg_daily_attendance membership_total membership_male_cnt 	///   
membership_male_pct membership_female_cnt membership_female_pct ///   
membership_white_cnt membership_white_pct membership_black_cnt  ///   
membership_black_pct membership_hispanic_cnt membership_hispanic_pct  ///   
membership_asian_cnt membership_asian_pct membership_aian_cnt  ///   
membership_aian_pct membership_hawaiian_cnt membership_hawaiian_pct  ///   
membership_two_or_more_cnt membership_two_or_more_pct  ///   
enrollment_free_lunch_cnt enrollment_free_lunch_pct  ///   
enrollment_reduced_lunch_cnt enrollment_reduced_lunch_pct attendance_rate  ///   
retention_rate dropout_rate graduation_rate transition_college_inout_cnt  ///   
transition_college_inout_pct transition_college_in_cnt  ///   
transition_college_in_pct transition_college_out_cnt  ///   
transition_college_out_pct transition_parttime_cnt transition_parttime_pct  ///   
transition_workforce_cnt transition_workforce_pct transition_vocational_cnt  ///   
transition_vocational_pct transition_failure_cnt transition_failure_pct  ///   
transition_military_cnt transition_military_pct fte_tch_total male_fte_total  ///   
female_fte_total white_fte_total black_fte_total hispanic_fte_total  ///   
asian_fte_total aian_fte_total hawaiian_fte_total two_or_more_fte_total  ///   
race_fte_total national_board_cert_tch_cnt pct_cls_not_hq_tch avg_yrs_tch_exp ///   
prof_qual_ba_pct prof_qual_ma_pct prof_qual_rank1_pct  ///   
prof_qual_specialist_pct prof_qual_doctorate_pct prof_qual_tch_pct  ///   
tch_prov_cert_pct stdnt_comp_ratio computer_5yr_old_pct pt_conference  ///   
sbdm_vote parents_on_council volunteer_hrs stdnt_tch_ratio)(ada studentsn malen malepct 	 ///   
femalen femalepct whiten whitepct blackn blackpct hispn hisppct asiann 		 ///   
asianpct aiann aianpct hawaiinn hawaiinpct multin multipct freelunn ///   
freelunpct redlunn redlunpct attendrate retention dropout graduation ///   
trnsihlion trnsihliopct trnsihlinn trnsihlinpct trnsihloutn trnsihloutpct ///   
trnsihlptn trnsihlptpct trnsworkn trnsworkpct trnsvocn trnsvocpct trnsfailn ///   
trnsfailpct trnsmiltn trnsmiltpct totfte malefte femalefte whitefte blackfte ///   
hispfte asianfte aianfte hawaiianfte multifte racefte nbctn nothqpct tchexpyrs ///   
tchbapct tchmapct tchrank1pct tchspecialpct tchphdpct tchhqpct tchprovcertpct ///   
std2comp comp5yrpct ptconf sbdmvote parentcouncil hrsvolunteer std2tch)

foreach v of var ada studentsn malen malepct 	 ///   
femalen femalepct whiten whitepct blackn blackpct hispn hisppct asiann 		 ///   
asianpct aiann aianpct hawaiinn hawaiinpct multin multipct freelunn ///   
freelunpct redlunn redlunpct attendrate retention dropout graduation ///   
trnsihlion trnsihliopct trnsihlinn trnsihlinpct trnsihloutn trnsihloutpct ///   
trnsihlptn trnsihlptpct trnsworkn trnsworkpct trnsvocn trnsvocpct trnsfailn ///   
trnsfailpct trnsmiltn trnsmiltpct totfte malefte femalefte whitefte blackfte ///   
hispfte asianfte aianfte hawaiianfte multifte racefte nbctn nothqpct tchexpyrs ///   
tchbapct tchmapct tchrank1pct tchspecialpct tchphdpct tchhqpct tchprovcertpct ///   
std2comp comp5yrpct ptconf sbdmvote parentcouncil hrsvolunteer std2tch {

	if substr(`"`: type `v''"', 1, 3) == "str" {
		qui: replace `v' = ustrregexra(`v', "([$,%])|([N/A])", "")
		destring `v', replace
	}
	else {
		continue
	}
}

keep schnm school dist_number sch_cd ncesid ada studentsn malen malepct 	 ///   
femalen femalepct whiten whitepct blackn blackpct hispn hisppct asiann 		 ///   
asianpct aiann aianpct hawaiinn hawaiinpct multin multipct freelunn ///   
freelunpct redlunn redlunpct attendrate retention dropout graduation ///   
trnsihlion trnsihliopct trnsihlinn trnsihlinpct trnsihloutn trnsihloutpct ///   
trnsihlptn trnsihlptpct trnsworkn trnsworkpct trnsvocn trnsvocpct trnsfailn ///   
trnsfailpct trnsmiltn trnsmiltpct totfte malefte femalefte whitefte blackfte ///   
hispfte asianfte aianfte hawaiianfte multifte racefte nbctn nothqpct tchexpyrs ///   
tchbapct tchmapct tchrank1pct tchspecialpct tchphdpct tchhqpct tchprovcertpct ///   
std2comp comp5yrpct ptconf sbdmvote parentcouncil hrsvolunteer std2tch

tempfile profile
qui: save `profile'.dta, replace
restore
use data/fullDataSetWithSchoolString.dta, clear
keep schnm school schid userid primkey 
merge m:1 schnm using `profile'.dta, 
qui: replace schnm = "CENTRAL_OFFICE" if mi(schnm)
qui: replace school = "CENTRAL OFFICE" if schnm == "CENTRAL_OFFICE"
qui: replace dist_number = "165" if schnm == "CENTRAL_OFFICE"
qui: replace sch_cd = "165" if schnm == "CENTRAL_OFFICE"

preserve
import excel using data/ACCOUNTABILITY_ACHIEVEMENT_SUMMARY.xlsx, 	 ///   
clear case(l) first
keep if dist_name == "Fayette County"
destring reading math science social_studies writing language_mechanics 	 ///   
total_points, replace
rename (reading math science social_studies writing language_mechanics 		 ///   
total_points)(rla mth sci hist write lang total)
collapse (sum) rla mth sci hist write lang total, by(dist_number sch_cd 	 ///   
ncesid performance_type)
qui: g perf = cond(performance_type == "Points", 1, 2)
drop if mi(ncesid)
keep dist_number sch_cd ncesid rla mth sci hist write lang total perf
qui: reshape wide rla mth sci hist write lang total, i(dist_number sch_cd 	 ///   
ncesid) j(perf)
tempfile acctachieve
save `acctachieve'.dta, replace
restore
merge m:1 ncesid using `acctachieve'.dta, gen(achieveacct)
preserve
import excel using data/ACCOUNTABILITY_GAP_SUMMARY.xlsx, 	 ///   
clear case(l) first
keep if dist_name == "Fayette County"
destring reading math science social_studies writing language_mechanics 	 ///   
total_points, replace
rename (reading math science social_studies writing language_mechanics 		 ///   
total_points)(rlagap mthgap scigap histgap writegap langgap totalgap)
collapse (sum) rlagap mthgap scigap histgap writegap langgap totalgap, 		 ///   
by(dist_number sch_cd ncesid performance_type)
qui: g perf = cond(performance_type == "Points", 1, 2)
drop if mi(ncesid)
keep dist_number sch_cd ncesid rlagap mthgap scigap histgap writegap langgap ///   
totalgap perf
qui: reshape wide rlagap mthgap scigap histgap writegap langgap totalgap, 	 ///   
i(dist_number sch_cd ncesid) j(perf)
tempfile acctgap
save `acctgap'.dta, replace
restore
merge m:1 ncesid using `acctgap'.dta, gen(gapacct)
preserve
import excel using data/ACCOUNTABILITY_GROWTH.xlsx, clear case(l) first
keep if dist_name == "Fayette County"
qui: replace nbr_tested = subinstr(nbr_tested, ",", "", .)
qui: destring nbr_tested reading_pct math_pct, replace
drop if mi(ncesid)
rename (nbr_tested reading_pct math_pct)(growtested growrla growmth)
keep dist_number sch_cd ncesid growtested growrla growmth
collapse (sum) growtested (mean) growrla growmth, by(dist_number sch_cd ncesid)
tempfile acctgrow
save `acctgrow'.dta, replace
restore
merge m:1 ncesid using `acctgrow'.dta, gen(growacct)
drop if mi(primkey)

qui: split std2comp, gen(studcomputer) parse(":")
drop std2comp
qui: destring studcomputer*, replace
// Make student to computer ratio a true ratio
qui: g std2comp = studcomputer2 / studcomputer1

qui: split std2tch, gen(studteacher) parse(":")
drop std2tch
qui: destring studteacher*, replace
// Make student to computer ratio a true ratio
qui: g std2tch = studteacher2 / studteacher1

drop studcomputer* studteacher*

compress

qui: saveold data/usersWithStateData.dta, v(13) replace




