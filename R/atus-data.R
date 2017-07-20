#' @title ATUS 2014 Activities
#' @name atusact
#' @description This is a 223,249 by 10 data frame relating to how ATUS respondents spent their diary day. It includes information such as activity codes, activity start and stop times, and locations. Due to the presence of multiple codes for things like activities and locations, the codes have not been converted to their appropriate labels for conciseness. This file differs from the original Activities file in that all variables relating to dependent care have been removed. Durations for events with a reported end time after 4am the following day have been truncated so that the cumulative duration of all activities do not exceed 24 hours for any individual.
#' @docType data
#' @usage atusact
#' @format A data frame with 223,249 observations on the following variables:
#' \describe{
#'  \item{tucaseid}{respondent ID}
#'  \item{actid}{activity number}
#'  \item{location}{where the activity was performed (see codebook)}
#'  \item{dur}{Duration of activity in minutes (last activity truncated at 4:00 a.m.)}
#' \item{cum_dur}{Cumulative duration of activity lengths in minutes; last activity truncated at
#' 4:00am or 1440 minutes; cumulative total of `duration` for each individual/activity combination}
#' \item{starttime}{Activity start time.}
#' \item{stoptime}{Activity stop time.}
#' \item{t1code}{Tier 1 activity code (see codebook for details).}
#' \item{t2code}{Tier 2 activity code (see codebook for details).}
#' \item{t3code}{Tier 3 activity code (see codebook for details).}
#'
#' }
#' @source \url{http://www.bls.gov/tus/datafiles_2014.htm} with code book at \url{http://www.bls.gov/tus/atusintcodebk14.pdf}.
#' @keywords datasets
#' @examples
#' data(atusact)
#'
NULL
#' @title ATUS 2014 Respondents
#' @name atusresp
#' @description This is a 11,592 by 19 data frame containing information on the respondents, including their labor force status, earnings, and the diary day (day on which they were interviewed).
#' @docType data
#' @usage atusresp
#' @format A data frame with 11,592 observations on the following variables:
#' \describe{
#'  \item{tucaseid}{respondent id}
#'  \item{earn_week_overtime}{total weekly overtime earnings}
#'  \item{hourly_wage}{hourly rate of pay on your main job excluding overtime pay, tips, and commissions}
#'  \item{hrs_weekly}{hours usually worked per week at this rate}
#'  \item{hourly_status}{paid hourly or nonhourly}
#'  \item{weekly_earn}{weekly earnings at main job}
#'  \item{other_payment}{whether respondent typically receives overtime pay, commissions, or tips at the main job}
#'  \item{weeks_year}{weeks paid per year}
#'  \item{hrs_weekly2}{hours worked per week at main job}
#'  \item{hrs_weekly_other}{hours worked per week at other jobs}
#'  \item{industry_code}{industry code (see codebook)}
#'  \item{occup_code}{occupation code (see codebook)}
#'  \item{labor_status}{labor force status}
#'  \item{student_status}{whether or not the respondent is currently enrolled in a high school, college, or university}
#'  \item{num_children}{number of children in household}
#'  \item{holiday}{whether the diary day was a holiday}
#'  \item{diary_date}{date of diary day in 'yyyymmdd' format}
#'  \item{diary_day}{day of week for diary day}
#'  \item{wt}{ATUS final weight}
#' }
#' @source \url{http://www.bls.gov/tus/datafiles_2014.htm} with code book at \url{http://www.bls.gov/tus/atusintcodebk14.pdf}.
#' @keywords datasets
#' @examples
#' data(atusresp)
#'
NULL
#' @title ATUS 2014 Activity Summary
#' @name atussum
#' @description This is a 11,592 by 393 data frame containing information on te total time each ATUS respondent spent doing each activity on the diary day.
#' @docType data
#' @usage atussum
#' @format A data frame with 11,592 observations on the following variables:
#' \describe{
#'  \item{tucaseid}{respondent id}
#'  \item{wt}{final ATUS weight}
#'  \item{age}{respondent age}
#'  \item{sex}{respondent sex}
#'  \item{edu}{respondent education level, condensed}
#'  \item{race}{respondent race, condensed}
#'  \item{hispanic}{whether the respondent identifies as Hispanic}
#'  \item{metro}{metropolitan status}
#' }
#' These variables are then followed by 384 variables relating to how much time each individual spent total on each of the activities, where each variable corresponds to a specific activity, denoted by its tier 1, tier 2, and tier 3 codes concatenated in its variable name.
#' @source \url{http://www.bls.gov/tus/datafiles_2014.htm} with code book at \url{http://www.bls.gov/tus/atusintcodebk14.pdf} and \url{http://www.bls.gov/tus/atuscpscodebk14.pdf}.
#' @keywords datasets
#' @examples
#' data(atussum)
#'
NULL
#' @title CPS 2014
#' @name atuscps
#' @description This is a 68,198 by 13 data frame containing information about each household member of all individuals in ATUS. The information here was merged in from the CPS and was collected 2 to 5 months before the ATUS interview.
#' @docType data
#' @usage atuscps
#' @format Contains information about each household member of all individuals selected to participate in ATUS.
#' A data frame with 68,198 observations on the following variables:
#' \describe{
#'  \item{tucaseid}{respondent id}
#'  \item{lineid}{household member id}
#'  \item{region}{region of household (definitions are listed in Appendix A of codebook)}
#'  \item{division}{census division of  household (definitions are listed in Appendix A of codebook)}
#'  \item{famincome}{family income}
#'  \item{housing_type}{type of housing unit}
#'  \item{hh_size}{number of members in household}
#'  \item{month}{month of interview}
#'  \item{edu}{respondent education level, condensed}
#'  \item{sex}{respondent sex}
#'  \item{age}{respondent age}
#'  \item{citizen}{citizenship status of respondent}
#'  \item{atus}{indicator for whether respondent was interviewd for ATUS}
#' }
#' @source \url{http://www.bls.gov/tus/datafiles_2014.htm}
#'
#' @keywords datasets
#' @examples
#' data(atuscps)
#'
NULL
