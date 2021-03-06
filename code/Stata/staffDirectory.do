// Import the employee list data set
import excel using ~/Desktop/kyemployeelist.xlsx, first clear case(l)

// Drop invalid email addresses
drop if regexm(email, "^(noemailfcps)")

// Make email address all lower cased
qui: replace email = lower(email)

// Remove extra spaces from job title and email variables
qui: replace jobdescription = trim(itrim(jobdescription))
qui: replace email = trim(itrim(email))

/* Rename the variables (email needs to be renamed to be joined with user 
activity data from the NWEA platform */
rename (lastname firstname mi location jobdescription email)				 ///   
(last first mi school title email_address)

// Replace embedded spaces in job descriptions and create cleaned variable from it
qui: g jobtitle = subinstr(title, " ", "_", .)

// Create a new variable called function to store categorical job types
qui: g function = .

// Defines accounting/finance based job types
{
#d ;
loc acctfin
21ST_CENTURY_GRANT_PROG_MAN
ACCOUNT_SPECIALIST
ACCTS_PAYABLE_SPECIALIST
BUDGET_ANALYST
CONSTRUCTION_BUDGET_ANALYST
FINANCE_ANALYST
FINANCIAL_SVCS_BOOKKEEPER
GRANTS_PROGRAM_COMPLIANCE
GRANT_ACCOUNTANT
GRANT_ANALYST
INSURANCE_SPECIALIST
PAYROLL_ACCOUNTING_MANAGER
PAYROLL_SPECIALIST
PROF_DEV_ACCOUNT_SPECIALIST
PURCHASING_TECHNICIAN
SCHOOL_ACCOUNT_SPEC_-_HIGH
SCHOOL_ACCT_SPEC_-_ELEM/MIDDLE
STAFFING_AND_BUDGET_SPECIALIST
STDT_ACT_FUNDS_BUDGET_ANALYST
TAX_AUDITING_SPECIALIST
TAX_PROCESSING_SPECIALIST
TAX_PROCESSING_SUPERVISOR
TRANSP_ACCOUNTS_PAYABLE_CLERK
WORKERS_COMP_ANALYST;
#d cr
}

// Defines District and School administration job types
{
#d ;
loc distadmin
ADMINISTRATIVE_DEAN
ASSC_DIR_HR_TCH_LEAD_EFFCTVNSS
ASSOCIATE_DIRECTOR_-_FINANCE
ASSOCIATE_DIRECTOR_EARLY_START
ASSOC_DIRECTOR_LOGISTICS
ASSOC_DIRECTOR_STDT_SUPPORT
ASSOC_DIR_-RECRUIT_&_RETENTION
ASSOC_DIR_-_HUMAN_RESOURCES
ASSOC_DIR_-_TAX_COLLECTION
ASSOC_DIR_COM_REL_CUST_SERV
ASSOC_DIR_FED_STATE_MAGNET_PRG
ASST_TO_DIR_OF_PUPIL_PERSONNEL
ACHIEVEMENT_&_COMPLIANCE_COACH
AGRISCIENCE_COMMUNITY_LIASON
CHIEF_ADMINISTRATION_OFFICER
CHIEF_OPERATING_OFFICER
COMMUNICATIONS_SPECIALIST
DATA_COMMUNICATIONS_SPECIALIST
DEAN_OF_STUDENTS
DIRECTOR_-_BUDGET_AND_STAFFING
DIRECTOR_-_FINANCIAL_SERVICES
DIRECTOR_-_FOOD_SERVICE
DIRECTOR_-_LAW_ENFORCEMENT
DIRECTOR_-_MAINTENANCE
DIRECTOR_-_PLANT_OPERATIONS
DIRECTOR_-_RISK_MANAGEMENT
DIRECTOR_-_TECHNOLOGY
DIRECTOR_-_TRANSPORTATION
DIRECTOR_-_WAREHOUSE
DIRECTOR_FACILITY_DESIGN/CONST
DIRECTOR_OF_EXCEPTIONAL_CHILD
DIRECTOR_OF_PUPIL_PERSONNEL
DIRECTOR_RESOURCE_ALLOCATION
DIR_-_COMMUNITY/SBDM/GOVT_SUPT
DIR_CURRICULUM_&_ASSESSMENT
DIR_OF_DISTRICT_PERSONNEL-HR
DIR_SCH_IMPRVMENT_&_INNOVATION
DISTRICT_TECH_COORDINATOR
DIST_ASSESSMENT_COORDINATOR
EBCE/SLC_PROGRAM_MANAGER
EMPLOYMENT_TRAINING_SPECIALIST
FAMILY/COMMUNITY_COORDINATOR
FAMILY/COMMUNITY_LIAISON
FAMILY_RESOURCE_CENTER_COORD
GRANT_PROGRAM_MANAGER
GRANT_WRITER
IAKSS_OFFICE_ASSISTANT_I
IAKSS_OFFICE_ASSISTANT_II
IAKSS_OFFICE_ASSISTANT_III
IAKSS_RECEPTIONIST
MANAGER_-_FINANCIAL_SYSTEMS
OTHER_CENTRAL_OFFICE_POSITIONS
PGES_COACH_-_ADMIN
PROGRAM_DIRECTOR
PROGRAM_SPECIALIST_II
PROG_MANAGER-MAGNET_&_FINE_ART
REGISTRAR
SAFETY_TRAINING_SUPERVISOR
SCHOOL_ADMINISTRATIVE_MANAGER
SCHOOL_BUSINESS_OFFICE_TRAINER
SUPV_-_SAFETY_HEALTH_ENVIRON;

loc schadmin
SCHOOL_ASSOCIATE_PRINCIPAL
SCHOOL_PRINCIPAL
SCHOOL_PRINCIPAL-INTERIM;
#d cr

foreach v of loc distadmin {
	qui: replace function = 4 if jobtitle == "`v'"
}

foreach v of loc schadmin {
	qui: replace function = 5 if jobtitle == "`v'"
}

}

// Defines clerical job types
{
#d ;
loc clerical
ADMINISTRATIVE_ASSISTANT_II
ADMINISTRATIVE_ASSISTANT_III
ADMIN_ASST-CHIEF_OFFICERS
ADMIN_ASST_TO_SUPERINTENDENT
ADMIN_ASST_TO_THE_BOARD_OF_ED
LEGAL_ADMINISTRATIVE_ASST
OUT-OF-AREA_ATTENDANCE_SPEC
PERSONNEL_ASSISTANT
SCHOOL_ADMINISTRATIVE_ASST_I
SCHOOL_ADMIN_ASST_II_-_ELEM
SCHOOL_ADMIN_ASST_II_-_HIGH
SCHOOL_ADMIN_ASST_II_-_MIDDLE
SCHOOL_OFFICE_ASSISTANT
STAFF_SUPP_ADMIN_ASST_I_(10.5)
STAFF_SUPP_ADMIN_ASST_I_(12MO);
#d cr


}

// Defines IT/IS job types
{
#d ;
loc itis
ADMINISTRATIVE_ANALYST
ATTENDANCE_ANALYST
COMPUTER_PROGRAMMER
DATABASE_ADMINISTRATOR
DATA_ENTRY_ASSISTANT
LAN_TECHNICIAN
MEMORANDUM_OF_AGREEMENT
MICROCOMPUTER_SPECIALIST
MIS_USER_SUPPORT_ANALYST
SCHOOL_MICROCOMPUTER_SPECIALIS
SUPV_-_SYSTEMS_INTEGRATION
SYSTEMS_ANALYST
TECHNOLOGY_RESOURCE_INSTRUCTOR
TRANSPORTATION_DATA_ASSISTANT
VOICE/DATA_COMMUNICATION_SPECL;
#d cr

foreach v of loc itis {
	qui: replace function = 3 if jobtitle == "`v'"
}

}

// Defines Special Education and Education Specialist job types
{
#d ;
loc sped
AUDIOLOGIST
BILINGUAL_PARAEDUCATOR
ATTENDANCE_SPECIALIST_-_MIDDLE
ATTENDANCE_SPEC_-_HIGH_SCHOOL
CAREER-BASED_SPECIALIST
CENTRAL_MEDIA_LIBRARIAN
COUNSELOR_-_MIDDLE/HIGH
DW_EXCEPT_CHILD_RESOURCE_INSTR
DW_RESOURCE_INSTRUCTOR
EARLY_START_PARAEDUCATOR
EDUCATIONAL_INTERPRETER_III
EXCEPTIONAL_CHILD_CONSULTANT
EXCEPTIONAL_CHILD_COORDINATOR
EXCEPTIONAL_CHILD_INSTRUCTOR
EXC_CHILD_-_HEARING_IMPAIRED
EXC_CHILD_-_VISUALLY_IMPAIRED
EXC_CHILD_FUNCTIONAL_MENTAL
EXC_CHILD_LEARNING_&_BEHAVIOR
EXC_CHILD_MILD_MENTAL_DISABLED
GUIDANCE_SPEC-SOCIAL_WORKER
GUIDANCE_SPECIALIST-COUNSELOR
HEALTH_SERVICES_COORDINATOR
HOME/SCHOOL_LIAISON
INSTRUCTIONAL_COORDINATOR
INSTRUCTIONAL_PARAEDUCATOR
INSTRUCTIONAL_SUPPORT_SPEC
INTERVENTION_SPECIALIST
KINDERGARTEN_PARAEDUCATOR
LOCAL_VOCATIONAL_SCHOOL_INSTR
LOCAL_VOC_SCHOOL_PRINCIPAL
MEDIA_LIBRARIAN
MEDIA_PRODUCER
MEDIA_PRODUCER/TECH_COORD
MEDIA_TECHNICIAN
MIGRANT_ADVOCATE/RECRUITER
OCCUPATIONAL_THERAPIST
PHYSICAL_THERAPIST
PRESCHOOL_ASSESS_SPECIALIST
PRESCHOOL_COMPLIANCE_COACH
SAFE_PARAEDUCATOR
SCHOOL_PSYCHOLOGIST
SCHOOL_SOCIAL_WORKER
SPECIAL_ED_PARENT_LIAISON
SPEECH_LANGUAGE_PATHOLOGIST
SPEECH_THERAPIST
SP_ED_PARA_-_FUNCTIONAL_MENTAL
SP_ED_PARA_-_LEARNING/BEHAVIOR
SP_ED_PARA_-_MILD_MENTAL_DISAB
SP_ED_PARA_-_PHYSICAL_DISABLED
SUB_PARAEDUCATOR;
#d cr

foreach v of loc sped {
	qui: replace function = 6 if jobtitle == "`v'"
}


}

// Defines Classroom Educator job types
{
#d ;
loc classroom
ELEM_ARTS_&_HUMANITIES_INSTRUC
ELEM_ART_INSTRUCTOR
ELEM_BAND_INSTRUCTOR
ELEM_CHINESE_INSTRUCTOR
ELEM_CLASSROOM_INSTRUCTOR
ELEM_CURRICULUM_INSTRUCTOR
ELEM_ESL_INSTRUCTOR
ELEM_GENERAL/VOCAL_MUSIC_INSTR
ELEM_INTERMEDIATE_INSTRUCTOR
ELEM_INTERVENTION_INSTRUCTOR
ELEM_JAPANESE_INSTRUCTOR
ELEM_KINDERGARTEN_INSTRUCTOR
ELEM_LITERACY_INSTRUCTOR
ELEM_MATH_INSTRUCTOR
ELEM_ORCHESTRA_INSTRUCTOR
ELEM_PGES_COACH_-_NON_ADMIN
ELEM_PHYSICAL_EDUC_INSTRUCTOR
ELEM_PRESCHOOL_INSTRUCTOR
ELEM_PRIMARY_INSTRUCTOR
ELEM_READING_INSTRUCTOR
ELEM_SCIENCE_INSTRUCTOR
ELEM_SPANISH_INSTRUCTOR
ELEM_TECHNOLOGY_INSTRUCTOR
EMERGENCY_SUBSTITUTE
GIFTED_&_TALENTED_INSTRUCTOR
HOMEBOUND_INSTRUCTOR
HS_AGRICULTURE_INSTRUCTOR
HS_ARTS_&_HUMANITIES
HS_ART_INSTRUCTOR
HS_BAND_INSTRUCTOR
HS_BUSINESS_INSTRUCTOR
HS_CHINESE_INSTRUCTOR
HS_CLASSROOM_INSTRUCTOR
HS_CONSUMER_LIFE_SCIENCE
HS_CURRICULUM_INSTRUCTOR
HS_EBCE_INSTRUCTOR
HS_ENGLISH
HS_ESL_INSTRUCTOR
HS_FRENCH_INSTRUCTOR
HS_GEN/VOCAL_MUSIC_INSTRUCTOR
HS_GERMAN_INSTRUCTOR
HS_JAPANESE_INSTRUCTOR
HS_LATIN_INSTRUCTOR
HS_MATH_INSTRUCTOR
HS_MULTI_POSITION
HS_ORCHESTRA_INSTRUCTOR
HS_PHYSICAL_EDUCATION
HS_READING_INSTRUCTOR
HS_ROTC_INSTRUCTOR
HS_SAFE_INSTRUCTOR
HS_SCIENCE_INSTRUCTOR
HS_SOCIAL_STUDIES_INSTRUCTOR
HS_SPANISH_INSTRUCTOR
HS_TECHNOLOGY_INSTRUCTOR
MID_ACADEMIC_INSTRUCTOR
MID_ARTS_&_HUMANITIES_INSTR
MID_ART_INSTRUCTOR
MID_BUSINESS/COMPUTER
MID_CHINESE_INSTRUCTOR
MID_CHORUS_INSTRUCTOR
MID_CONSUMER_LIFE_SCIENCE
MID_ESL_INSTRUCTOR
MID_FRENCH_INSTRUCTOR
MID_GEN/VOCAL_MUSIC_INSTRUC
MID_GERMAN_INSTRUCTOR
MID_HEALTH_INSTRUCTOR
MID_INTERVENTION_INSTRUCTOR
MID_JAPANESE_INSTRUCTOR
MID_LANGUAGE_ARTS_INSTRUCTOR
MID_LATIN_INSTRUCTOR
MID_LITERACY_INSTRUCTOR
MID_MATH_INSTRUCTOR
MID_MULTI_POSITION
MID_ORCHESTRA_INSTRUCTOR
MID_PGES_COACH_-_NON_ADMIN
MID_PHYSICAL_ED_INSTRUCTOR
MID_READING_INSTRUCTOR
MID_SAFE_INSTRUCTOR
MID_SCHOOL_BAND_INSTRUCTOR
MID_SCHOOL_CLASSROOM_INSTRUC
MID_SCHOOL_STAFF_ASSISTANT
MID_SCIENCE_INSTRUCTOR
MID_SOCIAL_STUDIES_INSTRUCTOR
MID_SPANISH_INSTRUCTOR
MID_SPEECH_AND_DRAMA
MID_TECH_ED_INSTRUCTOR
MID_WRITING_INSTRUCTOR
RET_SUBSTITUTE_TEACHER
SUBSTITUTE_TEACHER
TITLE_I_INSTRUCTOR;
#d cr

foreach v of loc classroom {
	qui: replace function = 7 if jobtitle == "`v'"
}

}

// Defines logistics/service-based job types
{
#d ;
loc logistics
BUS_DRIVER
BUS_MONITOR
CUSTODIAL_EQUIPMENT_MECHANIC
CUSTODIAL_SERVICES_TRAINER
CUSTODIAL_SUPERVISOR
CUSTODIAN
DISPATCHER
DRAFTING_SPECIALIST
ENERGY_SYS_OPERATOR/DISPATCHER
FOOD_SERVICE_ASSISTANT_I
FOOD_SERVICE_ASSISTANT_II
FOOD_SERVICE_BUDGET_ANALYST
FOOD_SERVICE_COORDINATOR
FOOD_SERVICE_DELIVERY_DRIVER
FOOD_SERVICE_MANAGER_I
FOOD_SERVICE_MANAGER_II
FOOD_SERVICE_MANAGER_III
FOOD_SERVICE_SUPERVISOR
GROUNDS_EQUIPMENT_MECHANIC
GROUNDS_SUPERVISOR
GROUNDS_WORKER_I
GROUNDS_WORKER_II
HVAC_TECHNICIAN
LAW_ENFORCEMENT_OFFICER
LAW_ENFORCEMENT_SERGEANT
LEAD_BUS_DRIVER_TRAINER
LEAD_CUSTODIAL_SERVICE_WORKER
LEAD_FOOD_SERVICE_ASSISTANT
LEAD_GROUNDS_EQUIPMENT_MECHANC
LEAD_GROUNDS_WORKER
LEAD_MAINTENANCE_TECHNICIAN
LEAD_UTILITY_WORKER
LEAD_WAREHOUSE_WORKER
MAIL_SPECIALIST
MAINTENANCE_PROJECT_COORD
MAINTENANCE_SUPERVISOR
MAINTENANCE_TECHNICAN_II
MAINTENANCE_TECHNICAN_IV
MAINTENANCE_TECHNICIAN_III
MAINT_WAREHOUSE_WORKER
MANAGER_OF_VEHICLE_MAINTENANCE
PRINTING_ASSISTANT
PRINTING_SUPERVISOR
SCHOOL_ENERGY_MANAGER
SCHOOL_OPERATIONS_MANAGER
SUB_FOOD_SERVICE
TITLE_I_VAN_DRIVER
TRANSPORTATION_DISPATCHER
TRANSPORTATION_MANAGER
TRANSPORTATION_RECORDS_CLERK
TRANSP_ROUTING_SPECIALIST
UTILITY_SERVICES_SUPERVISOR
UTILITY_WORKER_I
UTILITY_WORKER_II
VEHICLE_MAINTENANCE_ASSISTANT
VEHICLE_MAINTENANCE_SUPERVISOR
VEHICLE_MECHANIC_I
VEHICLE_MECHANIC_II
VEHICLE_UPHOLSTERY/GLASS_WORKR
WAREHOUSE_SUPERVISOR
WAREHOUSE_WORKER_II
WORK_CONTROL_COORDINATOR;
#d cr

foreach v in `acctfin' `clerical' `logistics' {
	qui: replace function = 2 if jobtitle == "`v'"
}

}

// Define value labels for job functions
la def function 	1 "Unknown" 2 "Accounting/Clerical/Ops" 				 ///
					3 "Information Tech/Systems"							 ///
					4 "District Administration/Central Office"				 ///
					5 "School Administration" 6 "Special Ed/Ed Specialists"	 ///   
					7 "Classroom Educators", modify

// Apply value labels
la val function function

// Clean up school names
qui: replace school = trim(itrim(ustrregexra(school, "(FOOD)|(SVC)|(SER.*)|(TRD)|(TRAD.*)|(FS)|(FD)|(SCH$)|(SCHOOL$)|(SCHL)|(MAGNET)", "")))
qui: replace school = ustrregexra(school, "(ELEM$)|(ELEMENTARY)|(ACAD-PRIMARY)", "ES")
qui: replace school = ustrregexra(school, "(MID$)|(MIDDLE$)|(MIDDLE-)|(MID SCHOOL)", "MS")
qui: replace school = ustrregexra(school, "(HIGH$)|(HIGH SCH)", "HS")
qui: replace school = "ATHENS CHILESBURG ES" if school == "ATHENS CHILESBURG"
qui: replace school = "B T WASHINGTON ES" if school == "BOOKER T WASH PRIMARY SRV"
qui: replace school = "BRYAN STATION MS" if school == "BRYAN STATION"
qui: replace school = "LIBERTY ES" if school == "LIBERTY"
qui: replace school = "MARTIN LUTHER KING ACADEMY" if school == "MLK ACADEMY"
qui: replace school = "PAUL LAURENCE DUNBAR HS" if school == "PAUL LAURENCE DUNBAR"
qui: replace school = "SANDERSVILLE ES" if school == "SANDERSVILLE"
qui: replace school = "WELLINGTON ES" if school == "WELLINGTON"
qui: replace school = "WILLIAM WELLS BROWN ES" if school == "WW BROWN"
foreach v in "BUDGET & STAFFING" "BUS GARAGE" "CENTRAL STORES/WAREHOUSE" 	 ///   
"CHIEF OPERATIONS OFFICE" "COMMUNITY & GOVT SUPPT" 							 ///   
"CURRICULUM AND ASSESSMENT" "DISTINGUISHED EDUCATORS" "EARLY START" 		 ///   
"FINANCIAL" "GENERAL ADMINISTRATION" "HUMAN RESOURCES" "KECSAC PROGRAMS"	 ///   
"LAW ENFORCEMENT" "MAINTENANCE SHOP" "PHYSICAL PLANT OPERATIONS" 			 ///   
"PUPIL PERSONNEL" "RISK/MANAGEMENT INSURANCE" "SCH IMPROVEMENT & INNOVATION" ///    
"SPECIAL EDUCATION" "STUDENT ACHIEVEMENT & SUPPORT" "DAY TREAMENT CENTER"	 ///   
"SUBSTITUTES-POSITIVE REPORTING" "TECHNOLOGY" "SCHOOL COMMUNITY & GOVT SUPPT" {
	qui: replace school = "CENTRAL OFFICE" if school == "`v'"
}

// Create a cleaned/condensed version of the school name variable
qui: g schnm = subinstr(school, " ", "_", .)

// Make sure email address uniquely identifies cases
isid email_address

// Create a numeric ID for individual school sites
encode school, gen(schid)

// Optimize the storage of the data before saving
compress

// Save the file using Stata 13 format in case others don't have Stata 14 available
qui: saveold ~/Desktop/sdpmplus/data/kyemployees.dta, replace v(13)
