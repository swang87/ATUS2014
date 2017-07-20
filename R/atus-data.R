#' @title ATUS Activities (2003-2016)
#' @name atusact
#' @description This is a 3,554,306 by 6 data frame relating to how ATUS respondents spent their diary day, taken from the ATUS 2003-2016 Activities file. It includes information such as activity codes, activity start and stop times, and locations. Activities are encoded using three 2-digit tier codes. The broadest classification of activities is tier 1, followed by tier 2, and tier 3. If one is not interested in studying the exact start and end times or frequencies of certain activities throughout the day, it may be more convenient to work with the Activity Summary dataset ('atussum') which contains the cumulative times spent on each activity in individual columns.
#' @docType data
#' @usage data(atusact)
#' @format A data frame with 3,554,306 observations on the following variables:
#' \describe{
#'  \item{tucaseid}{respondent ID}
#'  \item{actid}{activity number ('tuactivity_n')}
#' \item{duration}{activity duration in minutes, truncated to a 24-hour day ('tuactdur24')}
#' \item{start}{activity start time ('tustarttim')}
#' \item{stop}{activity stop time ('tustoptime')}
#' \item{tiercode}{6-digit tier 1/2/3 activity code ('trcodep'); e.g. '130124' corresponds to activity tier 1 = '13', tier 2 = '01', tier 3 = '24' (see codebook for details)}
#'
#' }
#' @source ATUS Activity data file from \url{https://www.bls.gov/tus/datafiles_0316.htm} with tier code book at \url{https://www.bls.gov/tus/lexiconnoex0316.pdf}.
#' @keywords datasets
#' @seealso \code{\link{atussum}} contains total durations spent in each activity code over the diary-day per individual.
#' @examples
#' data(atusact)
#'
#' # example activity: sleeping
#' #          tier 1 code = 01 (personal care)
#' #          tier 2 code = 01 (sleeping)
#' #          tier 3 code = all
#'
#' # this is a data frame with all start/stop/durations for sleeping
#' sleeping <- atusact[atusact$tiercode > 10100 & atusact$tiercode < 10200,]
#'
#' # example activity: doing homework (for a class towards a degree)
#' #          tier 1 code = 06
#' #          tier 2 code = 03
#' #          tier 3 code = 01
#'
#' hw <- atusact[atusact$tiercode == 60301,]
#' hist(hw$duration)
#' summary(hw$duration)
#'
#' # Note that all these durations (in minutes) are per-instance. They are not
#' # necessarily reflective of the total time spent on the activity over the diary day;
#' # e.g. if someone did homework for an hour in the morning and for an hour in the
#' # evening, that would constitute 2 rows in the data frame. To get an aggregate
#' # duration per day, we would want to sum over all durations of the activity for each
#' # individual. e.g. for homework:
#' hw_by_individual <- aggregate(duration ~ tucaseid, data=hw, FUN=sum)
#'
#' # Aggregate numbers can be more easily retrieved from the 'atussum' file that already
#' # has the aggregate durations per activity code (but does not include the start/stop
#' # times).
NULL
#' @title ATUS Respondent Information (2003-2016)
#' @name atusresp
#' @description This is a 181,335 by 21 data frame containing information on the respondents, including their employment, household, and the diary day (day on which they were interviewed). The data frame here is taken from the ATUS 2003-2016 Respondent file. Variables containing no more than 90\% values missing were considered for inclusion, especially those found on the ATUS Frequently Used Variables list.
#' @docType data
#' @usage data(atusresp)
#' @format A data frame with 181,335 observations. The following variables (with lower-case original variable name in parentheses, if different from the variable name here, for ease of matching to the official codebook):
#' \describe{
#'  \item{tucaseid}{respondent id}
#'  \item{tuyear}{ATUS year}
#'  \item{diary_date}{date of diary day in 'yyyymmdd' format ('tudiarydate')}
#'  \item{holiday}{whether the diary day was a holiday ('trholiday')}
#'  \item{occup_code}{occupation code ('trmjocc1'), see codebook for full unabbreviated list of categories}
#'  \item{ind_code}{industry code ('trmjind1'), see codebook for full unabbreviated list of categories}
#'  \item{labor_status}{labor force status ('telfs')}
#'  \item{student_status}{whether or not the respondent is currently enrolled in a high school, college, or university ('teschenr')}
#'  \item{ptft}{whether the respondent works part-time or full-time ('trdpftpt')}
#'  \item{work_class}{class of work ('teio1cow')}
#'  \item{hourly_wage}{hourly earnings at main job ('trernhly')}
#'  \item{weekly_earn}{weekly earnings at main job ('trernwa')}
#'  \item{work_hrs_week}{number of hours worked per week ('tehruslt')}
#'  \item{mult_jobs}{had more than 1 jobs in 7 days prior to interview ('temjot')}
#'  \item{partner_hh}{presence of respondent's spouse/unmarried partner in the household ('trsppres')}
#'  \item{partner_works}{employment status of spouse/partner ('tespempnot')}
#'  \item{partner_ptft}{whether the spouse/partner works part-time or full-time ('trspftpt')}
#'  \item{hh_size}{number of people living in household ('trnumhou')}
#'  \item{hh_child}{presence of household children aged < 18 ('trhhchild')}
#'  \item{hh_child_youngest_age}{age of youngest household child < 18 ('tryhhchild')}
#'  \item{wt}{ATUS final weight ('tufnwgtp')}
#' }
#' @source ATUS Respondent data file from \url{https://www.bls.gov/tus/datafiles_0316.htm} with code book at \url{https://www.bls.gov/tus/atusintcodebk0316.pdf}. A list of Frequently Used Variables can be found at \url{https://www.bls.gov/tus/freqvariables.pdf}.
#' @keywords datasets
#' @examples
#' data(atusresp)
#'
#' hist(atusresp$weekly_earn, main="Distribution of Weekly Earnings of ATUS Respondents (all years)")
#' boxplot(weekly_earn ~ tuyear, data=atusresp, horizontal=TRUE, las=1,
#'         main="Weekly Earnings by Year", ylab="Year", ylab="Weekly Earnings")
NULL
#' @title ATUS Respondent Activity Summary (2003-2016)
#' @name atussum
#' @description A data frame with 181,335 observations on the following variables:
#' @docType data
#' @usage data(atussum)
#' @format A data frame with 181,335 observations on the following:
#' \describe{
#'  \item{tucaseid}{respondent id}
#' \item{t010101}{}
#' \item{t010102}{}
#' \item{t010199}{}
#' \item{t010201}{}
#' \item{t010299}{}
#' \item{t010301}{}
#' \item{t010399}{}
#' \item{t010401}{}
#' \item{t010499}{}
#' \item{t010501}{}
#' \item{t010599}{}
#' \item{t019999}{}
#' \item{t020101}{}
#' \item{t020102}{}
#' \item{t020103}{}
#' \item{t020104}{}
#' \item{t020199}{}
#' \item{t020201}{}
#' \item{t020202}{}
#' \item{t020203}{}
#' \item{t020299}{}
#' \item{t020301}{}
#' \item{t020302}{}
#' \item{t020303}{}
#' \item{t020399}{}
#' \item{t020401}{}
#' \item{t020402}{}
#' \item{t020499}{}
#' \item{t020501}{}
#' \item{t020502}{}
#' \item{t020599}{}
#' \item{t020681}{}
#' \item{t020699}{}
#' \item{t020701}{}
#' \item{t020799}{}
#' \item{t020801}{}
#' \item{t020899}{}
#' \item{t020901}{}
#' \item{t020902}{}
#' \item{t020903}{}
#' \item{t020904}{}
#' \item{t020905}{}
#' \item{t020999}{}
#' \item{t029999}{}
#' \item{t030101}{}
#' \item{t030102}{}
#' \item{t030103}{}
#' \item{t030104}{}
#' \item{t030105}{}
#' \item{t030108}{}
#' \item{t030109}{}
#' \item{t030110}{}
#' \item{t030111}{}
#' \item{t030112}{}
#' \item{t030186}{}
#' \item{t030199}{}
#' \item{t030201}{}
#' \item{t030202}{}
#' \item{t030203}{}
#' \item{t030204}{}
#' \item{t030299}{}
#' \item{t030301}{}
#' \item{t030302}{}
#' \item{t030303}{}
#' \item{t030399}{}
#' \item{t030401}{}
#' \item{t030402}{}
#' \item{t030403}{}
#' \item{t030404}{}
#' \item{t030405}{}
#' \item{t030499}{}
#' \item{t030501}{}
#' \item{t030502}{}
#' \item{t030503}{}
#' \item{t030504}{}
#' \item{t030599}{}
#' \item{t039999}{}
#' \item{t040101}{}
#' \item{t040102}{}
#' \item{t040103}{}
#' \item{t040104}{}
#' \item{t040105}{}
#' \item{t040108}{}
#' \item{t040109}{}
#' \item{t040110}{}
#' \item{t040111}{}
#' \item{t040112}{}
#' \item{t040186}{}
#' \item{t040199}{}
#' \item{t040201}{}
#' \item{t040202}{}
#' \item{t040203}{}
#' \item{t040204}{}
#' \item{t040299}{}
#' \item{t040301}{}
#' \item{t040302}{}
#' \item{t040303}{}
#' \item{t040399}{}
#' \item{t040401}{}
#' \item{t040402}{}
#' \item{t040403}{}
#' \item{t040404}{}
#' \item{t040405}{}
#' \item{t040499}{}
#' \item{t040501}{}
#' \item{t040502}{}
#' \item{t040503}{}
#' \item{t040504}{}
#' \item{t040505}{}
#' \item{t040506}{}
#' \item{t040507}{}
#' \item{t040508}{}
#' \item{t040599}{}
#' \item{t049999}{}
#' \item{t050101}{}
#' \item{t050102}{}
#' \item{t050103}{}
#' \item{t050189}{}
#' \item{t050201}{}
#' \item{t050202}{}
#' \item{t050203}{}
#' \item{t050204}{}
#' \item{t050289}{}
#' \item{t050301}{}
#' \item{t050302}{}
#' \item{t050303}{}
#' \item{t050304}{}
#' \item{t050389}{}
#' \item{t050403}{}
#' \item{t050404}{}
#' \item{t050405}{}
#' \item{t050481}{}
#' \item{t050499}{}
#' \item{t059999}{}
#' \item{t060101}{}
#' \item{t060102}{}
#' \item{t060103}{}
#' \item{t060104}{}
#' \item{t060199}{}
#' \item{t060201}{}
#' \item{t060202}{}
#' \item{t060203}{}
#' \item{t060289}{}
#' \item{t060301}{}
#' \item{t060302}{}
#' \item{t060303}{}
#' \item{t060399}{}
#' \item{t060401}{}
#' \item{t060402}{}
#' \item{t060403}{}
#' \item{t060499}{}
#' \item{t069999}{}
#' \item{t070101}{}
#' \item{t070102}{}
#' \item{t070103}{}
#' \item{t070104}{}
#' \item{t070105}{}
#' \item{t070199}{}
#' \item{t070201}{}
#' \item{t070299}{}
#' \item{t070301}{}
#' \item{t070399}{}
#' \item{t079999}{}
#' \item{t080101}{}
#' \item{t080102}{}
#' \item{t080199}{}
#' \item{t080201}{}
#' \item{t080202}{}
#' \item{t080203}{}
#' \item{t080299}{}
#' \item{t080301}{}
#' \item{t080302}{}
#' \item{t080399}{}
#' \item{t080401}{}
#' \item{t080402}{}
#' \item{t080403}{}
#' \item{t080499}{}
#' \item{t080501}{}
#' \item{t080502}{}
#' \item{t080599}{}
#' \item{t080601}{}
#' \item{t080602}{}
#' \item{t080699}{}
#' \item{t080701}{}
#' \item{t080702}{}
#' \item{t080799}{}
#' \item{t080801}{}
#' \item{t080899}{}
#' \item{t089999}{}
#' \item{t090101}{}
#' \item{t090102}{}
#' \item{t090103}{}
#' \item{t090104}{}
#' \item{t090199}{}
#' \item{t090201}{}
#' \item{t090202}{}
#' \item{t090299}{}
#' \item{t090301}{}
#' \item{t090302}{}
#' \item{t090399}{}
#' \item{t090401}{}
#' \item{t090402}{}
#' \item{t090499}{}
#' \item{t090501}{}
#' \item{t090502}{}
#' \item{t090599}{}
#' \item{t099999}{}
#' \item{t100101}{}
#' \item{t100102}{}
#' \item{t100103}{}
#' \item{t100199}{}
#' \item{t100201}{}
#' \item{t100299}{}
#' \item{t100381}{}
#' \item{t100383}{}
#' \item{t100399}{}
#' \item{t100401}{}
#' \item{t100499}{}
#' \item{t109999}{}
#' \item{t110101}{}
#' \item{t110199}{}
#' \item{t110281}{}
#' \item{t110289}{}
#' \item{t119999}{}
#' \item{t120101}{}
#' \item{t120199}{}
#' \item{t120201}{}
#' \item{t120202}{}
#' \item{t120299}{}
#' \item{t120301}{}
#' \item{t120302}{}
#' \item{t120303}{}
#' \item{t120304}{}
#' \item{t120305}{}
#' \item{t120306}{}
#' \item{t120307}{}
#' \item{t120308}{}
#' \item{t120309}{}
#' \item{t120310}{}
#' \item{t120311}{}
#' \item{t120312}{}
#' \item{t120313}{}
#' \item{t120399}{}
#' \item{t120401}{}
#' \item{t120402}{}
#' \item{t120403}{}
#' \item{t120404}{}
#' \item{t120405}{}
#' \item{t120499}{}
#' \item{t120501}{}
#' \item{t120502}{}
#' \item{t120503}{}
#' \item{t120504}{}
#' \item{t120599}{}
#' \item{t129999}{}
#' \item{t130101}{}
#' \item{t130102}{}
#' \item{t130103}{}
#' \item{t130104}{}
#' \item{t130105}{}
#' \item{t130106}{}
#' \item{t130107}{}
#' \item{t130108}{}
#' \item{t130109}{}
#' \item{t130110}{}
#' \item{t130111}{}
#' \item{t130112}{}
#' \item{t130113}{}
#' \item{t130114}{}
#' \item{t130115}{}
#' \item{t130116}{}
#' \item{t130117}{}
#' \item{t130118}{}
#' \item{t130119}{}
#' \item{t130120}{}
#' \item{t130121}{}
#' \item{t130122}{}
#' \item{t130123}{}
#' \item{t130124}{}
#' \item{t130125}{}
#' \item{t130126}{}
#' \item{t130127}{}
#' \item{t130128}{}
#' \item{t130129}{}
#' \item{t130130}{}
#' \item{t130131}{}
#' \item{t130132}{}
#' \item{t130133}{}
#' \item{t130134}{}
#' \item{t130135}{}
#' \item{t130136}{}
#' \item{t130199}{}
#' \item{t130201}{}
#' \item{t130202}{}
#' \item{t130203}{}
#' \item{t130204}{}
#' \item{t130205}{}
#' \item{t130206}{}
#' \item{t130207}{}
#' \item{t130208}{}
#' \item{t130209}{}
#' \item{t130210}{}
#' \item{t130211}{}
#' \item{t130212}{}
#' \item{t130213}{}
#' \item{t130214}{}
#' \item{t130215}{}
#' \item{t130216}{}
#' \item{t130217}{}
#' \item{t130218}{}
#' \item{t130219}{}
#' \item{t130220}{}
#' \item{t130221}{}
#' \item{t130222}{}
#' \item{t130223}{}
#' \item{t130224}{}
#' \item{t130225}{}
#' \item{t130226}{}
#' \item{t130227}{}
#' \item{t130228}{}
#' \item{t130229}{}
#' \item{t130230}{}
#' \item{t130231}{}
#' \item{t130232}{}
#' \item{t130299}{}
#' \item{t130301}{}
#' \item{t130302}{}
#' \item{t130399}{}
#' \item{t130401}{}
#' \item{t130402}{}
#' \item{t130499}{}
#' \item{t139999}{}
#' \item{t140101}{}
#' \item{t140102}{}
#' \item{t140103}{}
#' \item{t140104}{}
#' \item{t140105}{}
#' \item{t149999}{}
#' \item{t150101}{}
#' \item{t150102}{}
#' \item{t150103}{}
#' \item{t150104}{}
#' \item{t150105}{}
#' \item{t150106}{}
#' \item{t150199}{}
#' \item{t150201}{}
#' \item{t150202}{}
#' \item{t150203}{}
#' \item{t150204}{}
#' \item{t150299}{}
#' \item{t150301}{}
#' \item{t150302}{}
#' \item{t150399}{}
#' \item{t150401}{}
#' \item{t150402}{}
#' \item{t150499}{}
#' \item{t150501}{}
#' \item{t150599}{}
#' \item{t150601}{}
#' \item{t150602}{}
#' \item{t150699}{}
#' \item{t159989}{}
#' \item{t160101}{}
#' \item{t160102}{}
#' \item{t160103}{}
#' \item{t160104}{}
#' \item{t160105}{}
#' \item{t160106}{}
#' \item{t160107}{}
#' \item{t160108}{}
#' \item{t169989}{}
#' \item{t180101}{}
#' \item{t180199}{}
#' \item{t180280}{}
#' \item{t180381}{}
#' \item{t180382}{}
#' \item{t180399}{}
#' \item{t180481}{}
#' \item{t180482}{}
#' \item{t180499}{}
#' \item{t180501}{}
#' \item{t180502}{}
#' \item{t180589}{}
#' \item{t180601}{}
#' \item{t180682}{}
#' \item{t180699}{}
#' \item{t180701}{}
#' \item{t180782}{}
#' \item{t180801}{}
#' \item{t180802}{}
#' \item{t180803}{}
#' \item{t180804}{}
#' \item{t180805}{}
#' \item{t180806}{}
#' \item{t180807}{}
#' \item{t180899}{}
#' \item{t180901}{}
#' \item{t180902}{}
#' \item{t180903}{}
#' \item{t180904}{}
#' \item{t180905}{}
#' \item{t180999}{}
#' \item{t181002}{}
#' \item{t181081}{}
#' \item{t181099}{}
#' \item{t181101}{}
#' \item{t181199}{}
#' \item{t181201}{}
#' \item{t181202}{}
#' \item{t181204}{}
#' \item{t181283}{}
#' \item{t181299}{}
#' \item{t181301}{}
#' \item{t181302}{}
#' \item{t181399}{}
#' \item{t181401}{}
#' \item{t181499}{}
#' \item{t181501}{}
#' \item{t181599}{}
#' \item{t181601}{}
#' \item{t181699}{}
#' \item{t181801}{}
#' \item{t181899}{}
#' \item{t189999}{}
#' \item{t500101}{}
#' \item{t500103}{}
#' \item{t500104}{}
#' \item{t500105}{}
#' \item{t500106}{}
#' \item{t500107}{}
#' \item{t509989}{}
#' }
#' There are additionally 431 variables with column names of the form \code{tAABBCC} relating to how much time each individual spent total on each of the activities over the course of the diary day, where each variable corresponds to a specific activity, denoted by its tier 1 (digits \code{AA}), tier 2 (digits \code{BB}), and tier 3 (digits \code{CC}) codes concatenated in its variable name.
#' @source ATUS Activity Summary data file from \url{https://www.bls.gov/tus/datafiles_0316.htm} with tier code book at \url{https://www.bls.gov/tus/lexiconnoex0316.pdf}.
#' @keywords datasets
#' @seealso \code{\link{atusact}} contains individual records of each activity for each individual, along with start/stop-times and durations.
#' @examples
#' data(atussum)
#' # example activity: sleeping
#' #          tier 1 code = 01 (personal care)
#' #          tier 2 code = 01 (sleeping)
#' #          tier 3 code = all
#'
#' # this is a data frame with all individuals with only the 'tucaseid' column and the
#' # columns containing the activity code columns for sleep; each value is the total
#' # duration spent by the individual over the course of the diary day in each activity
#' # column
#' sleeping <- atussum[,c(1, grep("t0101", colnames(atussum)))]
#'
#' # example activity: doing homework (for a class towards a degree)
#' #          tier 1 code = 06
#' #          tier 2 code = 03
#' #          tier 3 code = 01
#'
#' hw <- atussum[, c("tucaseid", "t060301")]
#' hist(hw$t060301)
#' summary(hw$t060301)
#'
#' # removing the 0's (likely non-students!)
#' hist(hw$t060301[hw$t060301 > 0])
NULL
#' @title Current Population Survey for ATUS Households (2003-2016)
#' @name atuscps
#' @description This is a 1,008,405 by 18 data frame containing information about each household member of all individuals selected to participate in the ATUS, regardless of whether or not they actually responded to the ATUS. The 'tucaseid' variable identifies unique households. The 'lineid' variable enumerates individuals within each household. All individuals selected to participate in the ATUS have 'lineid' = 1. Note that the information collected in this dataset was done so 2 to 5 months before the ATUS interview. Variables containing no more than 80\% values missing were considered for inclusion, especially those found on the ATUS Frequently Used Variables list.
#' @docType data
#' @usage data(atuscps)
#' @format Contains information about each household member of all individuals selected to participate in ATUS.
#' A data frame with 942,073 observations on the following variables:
#' \describe{
#'  \item{tucaseid}{household id}
#'  \item{lineid}{household member id ('tulineno'), equals 1 if selected for ATUS}
#'  \item{region}{region of household (definitions are listed in Appendix A of codebook) ('gereg')}
#'  \item{state}{state of household ('gestfips')}
#'  \item{sex}{respondent sex ('pesex')}
#'  \item{age}{respondent age ('prtage'); prior to May 2004, 80 meant age 80+, afterwards, 85 meant age 85+}
#'  \item{edu}{respondent education level, only available for adults ('peeduca')}
#'  \item{race}{respondent race ('ptdtrace')}
#'  \item{hispanic}{respondent identifies as hispanic? ('pehspnon')}
#'  \item{country_born}{respondent's country of birth ('penatvty'), "US" means continental U.S. and "non-US" means otherwise}
#'  \item{citizen}{citizenship status of respondent ('prcitshp')}
#'  \item{marital}{respondent's marital status ('pemaritl')}
#'  \item{hh_size}{number of members in household ('hrnumhou')}
#'  \item{home_type}{rent or own home ('hetenure')}
#'  \item{famincome}{income in dollars of all family members aged 15+ in the past 12 months including work earnings, pensions, and dividends ('hefaminc' and 'hufaminc'), see codebook for details about topcoding, which has changed in October 2003}
#'  \item{cps_year}{year of last CPS interview ('hryear4')}
#'  \item{cps_month}{month of last CPS interview ('hrmonth')}
#'  \item{atus}{whether respondent was selected to interview for ATUS ('tulineno' == 1)}
#' }
#' @source ATUS-CPS data file from \url{https://www.bls.gov/tus/datafiles_0316.htm}  with code book at \url{https://www.bls.gov/tus/atuscpscodebk0316.pdf}. A list of Frequently Used Variables can be found at \url{https://www.bls.gov/tus/freqvariables.pdf}.
#'
#' @keywords datasets
#' @examples
#' data(atuscps)
#'
#' # to obtain only the atus respondents:
#' cps <- atuscps[atuscps$atus == "yes",]
#'
#' # distribution of households across regions of the U.S.
#' # note that stratified sampling was done
#' barplot(table(cps$region))
#'
#' barplot(table(cps$race), horiz=TRUE, las=1)
#'
#' hist(cps$age)
NULL
