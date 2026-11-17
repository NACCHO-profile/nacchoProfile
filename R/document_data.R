#' Master data: NACCHO 2025 Profile
#'
#' Cleaned and derived respondent-level data from the 2025 National Profile
#' of Local Health Departments dashboard dataset. Contains the raw survey
#' variables (names prefixed `c0`–`c14`, `m6`–`m14`, etc.) plus derived
#' fields used across the dashboard.
#'
#' Key derived columns include:
#' \itemize{
#'   \item `c0popcat3`: ordered factor — Small (<50,000),
#'     Medium (50,000-499,999), Large (500,000+)
#'   \item `employee_bypop`: employees per 10,000 population
#'   \item `employee_numcat`: labelled numeric employee-count category
#'   \item `rev_total`, `rev_percap`: total revenue and revenue per capita
#'   \item `exp_total_numcat`, `rev_total_numcat`: ordered factor
#'     expenditure / revenue brackets
#'   \item `exp_percap_numcat`, `rev_percap_numcat`: ordered factor
#'     per-capita brackets
#'   \item `fips`, `state_name`: FIPS code and state name (from `usmap`)
#' }
#'
#' @format A data frame with one row per LHD and ~1,200 variables. See the
#'   `data-raw/` scripts for the full derivation.
#' @source NACCHO National Profile of Local Health Departments, 2025.
"master_data"



#' Meta data for The National Profile of Local Health Departments, 2022
#'
#' @author Lindsay Jorgenson
#' @references \email{ljorgenson@@astho.org}
#'
#'
#' @format data.frame
#'
#' A data frame with 11 observations of 8 variables ****UPDATE WHEN COMPLETE
#' \describe{
#'   \item{field}{Field from master_data}
#'   \item{title}{Title for the data visualization}
#'   ...
#' }
#' @source National Association of City and County Health Officials (NACCHO)
"meta"



#' Dataset for field/specialization of top executive from The National Profile
#'  of Local Health Departments, 2022 master data
#'
#' @author Lindsay Jorgenson
#' @references \email{ljorgenson@@astho.org}
#'
#'
#' @format data.frame
#'
#' A data frame with 36 observations of 12 variables
#'
#' @source National Association of City and County Health Officials (NACCHO)
"spec_data"


#' Dataset for field/specialization of top executive from The National Profile
#'  of Local Health Departments, 2022 master data
#'
#' @author Lindsay Jorgenson
#' @references \email{ljorgenson@@astho.org}
#'
#'
#' @format data.frame
#'
#' A data frame with 3 observations of 13 variables
#'
#' @source National Association of City and County Health Officials (NACCHO)
"spec_data_all"


#' Dataset for definitions for The National Profile
#'  of Local Health Departments, 2022 master data
#'
#' @author Lindsay Jorgenson
#' @references \email{ljorgenson@@astho.org}
#'
#'
#' @format data.frame
#'
#' A data frame with 26 observations of 6 variables
#'
#' @source National Association of City and County Health Officials (NACCHO)
"definitions"


#' Dataset for notes for The National Profile
#'  of Local Health Departments, 2022 master data
#'
#' @author Lindsay Jorgenson
#' @references \email{ljorgenson@@astho.org}
#'
#'
#' @format data.frame
#'
#' A data frame with 39 observations of 7 variables
#'
#' @source National Association of City and County Health Officials (NACCHO)
"notes"



#' Source Line for NACCHO's 2022 National Profile
#'
#' @author Lindsay Jorgenson
#' @references \email{ljorgenson@@astho.org}
#'
#'
#' @format character
#'
#' A character: <b> Source: </b> 2022 National Profile of Local Health
#' Departments. National Association of County and City Health Officials. Washington, DC. (2024).
#'
#' @source National Association of City and County Health Officials (NACCHO)
"source_line"




#' Occupational Classifications Data "A" for NACCHO's 2022 National Profile
#'
#' @author Lindsay Jorgenson
#' @references \email{ljorgenson@@astho.org}
#'
#'
#' @format data.frame
#'
#' A dataframe with 38 observations and 32 variables. Created so dynamic
#' rendering is more smooth and quick. Data "A" is associated with the
#' percent of agencies with the classification.
#'
#' @source National Association of City and County Health Officials (NACCHO)
"classification_data_a"




#' Occupational Classifications Data "B" for NACCHO's 2022 National Profile
#'
#' @author Lindsay Jorgenson
#' @references \email{ljorgenson@@astho.org}
#'
#'
#' @format data.frame
#'
#' A dataframe with 19 observations and 18 variables. Created so dynamic
#' rendering is more smooth and quick. Data "B" is associated with the
#' total FTEs in the classification.
#'
#' @source National Association of City and County Health Officials (NACCHO)
"classification_data_b"



#' Jobs Lost and Added for NACCHO's 2022 National Profile
#'
#' @author Lindsay Jorgenson
#' @references \email{ljorgenson@@astho.org}
#'
#'
#' @format data.frame
#'
#' A dataframe with 26 observations and 20 variables. Created so dynamic
#' rendering is more smooth and quick.
#'
#' @source National Association of City and County Health Officials (NACCHO)
"jobs_data"

#' Advocacy Data for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#'
#' @format data.frame
#'
#' A data frame with 572 observations and 15 variables. Created so dynamic
#' rendering is smoother and quicker.
#'
#'
#' @source National Association of City and County Health Officials (NACCHO)
"advocacy_data"

#' Behavioral Health Data for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format data.frame
#'
#' A data frame with 26 observations and 14 variables. Created to ensure smooth dynamic
#' rendering.
#'
#'
#' @source National Association of City and County Health Officials (NACCHO)
"behav_data"


#' Boxplot List Data for NACCHO's 2022 National Profile
#'
#' @author Lindsay Jorgenson
#' @references \email{mmarshall@@astho.org}
#'
#' @format list
#'
#' A list with 20 items representing boxplot data. Created for smooth dynamic
#' visualization.
#'
#' @source National Association of City and County Health Officials (NACCHO)
"boxplot_list"


#' Budget Data for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format data.frame
#'
#' A data frame with 26 observations and 25 variables. Contains budget-related information for local health departments.
#'
#'
#' @source National Association of City and County Health Officials (NACCHO)
"budget_data"


#' CHIP Data for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format data.frame
#'
#' A data frame with 384 observations and 15 variables.
#' Contains data related to Community Health Improvement Plans (CHIP).
#'
#'
#' @source National Association of City and County Health Officials (NACCHO)
"chip_data"


#' Communication Use Data for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format data.frame
#'
#' A data frame with 345 observations and 15 variables.
#' Contains data on communication methods used by local health departments.
#'
#' @source National Association of City and County Health Officials (NACCHO)
"comms_use_data"


#' Dental Services Data for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format data.frame
#'
#' A data frame with 26 observations and 14 variables.
#' Contains data on dental services provided by local health departments.
#'
#'
#' @source National Association of City and County Health Officials (NACCHO)
"dental_data"


#' Medical Services Data for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format data.frame
#'
#' A data frame with 26 observations and 14 variables.
#' Contains data on medical services provided by local health departments.
#'
#'
#' @source National Association of City and County Health Officials (NACCHO)
"med_data"


#' New Advocacy Data for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format data.frame
#'
#' A data frame with 501 observations and 15 variables.
#' Contains new advocacy-related data collected in the 2022 survey.
#'
#'
#' @source National Association of City and County Health Officials (NACCHO)
"new_advocacy_data"


#' Other Topics Data for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format list
#'
#'
#' @source National Association of City and County Health Officials (NACCHO)
"other_topics"


#' Revenue Percentages for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format data.frame
#'
#' A data frame with 10 observations and 3 variables. Contains data related to revenue sources and percentages for local health departments.
#'
#' \describe{
#'   \item{id}{Unique identifier for the local health department (LHD).}
#'   \item{revenue_source}{Source of revenue for the LHD.}
#'   \item{percentage}{Percentage of total revenue from each source.}
#' }
#'
#' @source National Association of City and County Health Officials (NACCHO)
"revenue_percentages"


#' Revenue Percentages Filter Data for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format data.frame
#'
#' A data frame with 120 observations and 6 variables.
#' Filtered data for dynamic rendering of revenue percentages.
#'
#' @source National Association of City and County Health Officials (NACCHO)
"revenue_percentages_filter"


#' Services Change Data for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format data.frame
#'
#' A data frame with 507 observations and 18 variables.
#' Contains data related to changes in services offered by local health departments.
#'
#'
#' @source National Association of City and County Health Officials (NACCHO)
"services_change_data"


#' Services Data for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format data.frame
#'
#' A data frame with 4143 observations and 18 variables.
#' Contains data on services provided by local health departments.
#'
#'
#' @source National Association of City and County Health Officials (NACCHO)
"services_data"


#' Technology Use Data for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format data.frame
#'
#' A data frame with 299 observations and 15 variables.
#' Contains data on technology use by local health departments.
#'
#'
#' @source National Association of City and County Health Officials (NACCHO)
"tech_use_data"

#' Historical NACCHO National Profile Data for Line Viz
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format data.frame
#'
#' A data frame with 835 observations and 10 variables.
#' Contains data profile data over time.
#'
#'
#' @source National Association of City and County Health Officials (NACCHO)
"lines_data"

#' LDH Partnerships Data for NACCHO's 2022 National Profile
#'
#' @author Madoc Alder
#' @references \email{mmarshall@@astho.org}
#'
#' @format data.frame
#'
#' A data frame with 88 observations and 4 variables.
#' Contains data profile data over time.
#'
#'
#' @source National Association of City and County Health Officials (NACCHO)
"partnerships"


#' Master data 2022
#'
#' Respondent-level data from the 2022 Profile study, with the same derived
#' fields as \code{master_data}.
#'
#' @format A data frame; see \code{\link{master_data}} for column details.
#' @source NACCHO National Profile of Local Health Departments, 2022.
"master_data22"

#' Service categories
#'
#' Lookup table mapping LHD service categories to classification and
#' provision values used in the services module.
#'
#' @format A data frame with columns:
#' \describe{
#'   \item{service_classification}{Service classification label}
#'   \item{service_provision}{Provision category}
#'   \item{service_type}{Service type}
#'   \item{service_cats}{Display label}
#' }
"service_cats"

#' Source line 2022
#'
#' Source/citation metadata used for figure footnotes in the 2022 Profile
#' figures (e.g. sample size, weighting note, year).
#'
#' @format A data frame with columns:
#' \describe{
#'   \item{source_line}{Citation / source line text}
#'   \item{source_line_2022}{Citation text for 2022 comparisons}
#'   \item{year}{Survey year}
#' }
"source_line_2022"
