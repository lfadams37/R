############ INSTALL PACKAGES ################
#Install dev version due to errors in live

#if (!require("devtools")) install.packages("devtools")
#devtools::install_github("PMassicotte/gtrendsR")

############ LOAD LIBRARY ####################
library(gtrendsR)
library(dplyr)
############ DATE VARIABLES #######################

ytd18 <- "2017-12-31 2018-11-24"
ytdpy <- "2017-01-01 2017-11-25" # +1 to CY end date
wks <- "2018-11-11 2018-11-24"
pywks <- "2017-11-12 2017-11-25"

############ SEARCH TERM VARIABLES #######################
searchterms <- c("LEGOLAND Florida") #, "Walt Disney World","Universal Studios Florida","SeaWorld Orlando")
llf <- c("LEGOLAND Florida")
wdw <- c("Walt Disney World")
usf <-c("Universal Studios Florida")
swo <- c("SeaWorld Orlando")

############ PULL DATA #########################

# LEGOLAND FL 2 WKS

llfwks_WW <- gtrends( llf, geo = c(""), time = wks) # 2 weeks
llfwkspy_WW <- gtrends( llf, geo = c(""), time = pywks) # 2 weeks
llfwks_US <- gtrends( llf, geo = c("US"), time = wks) # 2 weeks
llfwkspy_US <- gtrends( llf, geo = c("US"), time = pywks) # 2 week
llfwks_FL <- gtrends( llf, geo = c("US-FL"), time = wks) # 2 weeks
llfwkspy_FL <- gtrends( llf, geo = c("US-FL"), time = pywks) # 2 weeks

#llfwks_FL$interest_over_time$hits 

# LEGOLAND FL YTD

llfytd_WW <- gtrends( llf, geo = c(""), time = ytd18) # 2 weeks
llfytdpy_WW <- gtrends( llf, geo = c(""), time = ytdpy) # 2 weeks
llfytd_US <- gtrends( llf, geo = c("US"), time = ytd18) # 2 weeks
llfytdpy_US <- gtrends( llf, geo = c("US"), time = ytdpy) # 2 week
llfytd_FL <- gtrends( llf, geo = c("US-FL"), time = ytd18) # 2 weeks
llfytdpy_FL <- gtrends( llf, geo = c("US-FL"), time = ytdpy) # 2 weeks

# WALT DISNEY WORLD WKS

wdwwks_WW <- gtrends( wdw, geo = c(""), time = wks) # 2 weeks
wdwwkspy_WW <- gtrends( wdw, geo = c(""), time = pywks) # 2 weeks
wdwwks_US <- gtrends( wdw, geo = c("US"), time = wks) # 2 weeks
wdwwkspy_US <- gtrends( wdw, geo = c("US"), time = pywks) # 2 week
wdwwks_FL <- gtrends( wdw, geo = c("US-FL"), time = wks) # 2 weeks
wdwwkspy_FL <- gtrends( wdw, geo = c("US-FL"), time = pywks) # 2 weeks

# Walt Disney World YTD

wdwytd_WW <- gtrends( wdw, geo = c(""), time = ytd18) # YTD
wdwytdpy_WW <- gtrends( wdw, geo = c(""), time = ytdpy) # YTD
wdwytd_US <- gtrends( wdw, geo = c("US"), time = ytd18) # YTD
wdwytdpy_US <- gtrends( wdw, geo = c("US"), time = ytdpy) # YTD
wdwytd_FL <- gtrends( wdw, geo = c("US-FL"), time = ytd18) # YTD
wdwytdpy_FL <- gtrends( wdw, geo = c("US-FL"), time = ytdpy) # YTD

# Universal Stuidios Florida WKS

usfwks_WW <- gtrends( usf, geo = c(""), time = wks) # 2 weeks
usfwkspy_WW <- gtrends( usf, geo = c(""), time = pywks) # 2 weeks
usfwks_US <- gtrends( usf, geo = c("US"), time = wks) # 2 weeks
usfwkspy_US <- gtrends( usf, geo = c("US"), time = pywks) # 2 week
usfwks_FL <- gtrends( usf, geo = c("US-FL"), time = wks) # 2 weeks
usfwkspy_FL <- gtrends( usf, geo = c("US-FL"), time = pywks) # 2 weeks

# Universal Stuidios Florida YTD

usfytd_WW <- gtrends( usf, geo = c(""), time = ytd18) # YTD
usfytdpy_WW <- gtrends( usf, geo = c(""), time = ytdpy) # YTD
usfytd_US <- gtrends( usf, geo = c("US"), time = ytd18) # YTD
usfytdpy_US <- gtrends( usf, geo = c("US"), time = ytdpy) # YTD
usfytd_FL <- gtrends( usf, geo = c("US-FL"), time = ytd18) # YTD
usfytdpy_FL <- gtrends( usf, geo = c("US-FL"), time = ytdpy) # YTD

# SeaWorld WKS

swowks_WW <- gtrends( swo, geo = c(""), time = wks) # 2 weeks
swowkspy_WW <- gtrends( swo, geo = c(""), time = pywks) # 2 weeks
swowks_US <- gtrends( swo, geo = c("US"), time = wks) # 2 weeks
swowkspy_US <- gtrends( swo, geo = c("US"), time = pywks) # 2 week
swowks_FL <- gtrends( swo, geo = c("US-FL"), time = wks) # 2 weeks
swowkspy_FL <- gtrends( swo, geo = c("US-FL"), time = pywks) # 2 weeks

# SeaWorld YTD

swoytd_WW <- gtrends( swo, geo = c(""), time = ytd18) # YTD
swoytdpy_WW <- gtrends( swo, geo = c(""), time = ytdpy) # YTD
swoytd_US <- gtrends( swo, geo = c("US"), time = ytd18) # YTD
swoytdpy_US <- gtrends( swo, geo = c("US"), time = ytdpy) # YTD
swoytd_FL <- gtrends( swo, geo = c("US-FL"), time = ytd18) # YTD
swoytdpy_FL <- gtrends( swo, geo = c("US-FL"), time = ytdpy) # YTD

################# ROW BIND DATA ############################
ww_ytd <- bind_rows(llfytd_WW$interest_over_time, #LLF YTD
                    llfytdpy_WW$interest_over_time,    #LLF PY
                    wdwytd_WW$interest_over_time,      #WDW YTD
                    wdwytdpy_WW$interest_over_time,    #WDW PY
                    usfytd_WW$interest_over_time,      #USF YTD
                    usfytdpy_WW$interest_over_time,    #USF PY
                    swoytd_WW$interest_over_time,      #SWO YTD
                    swoytdpy_WW$interest_over_time)    #SWO PY

us_ytd <- bind_rows(llfytd_US$interest_over_time,
                    llfytdpy_US$interest_over_time,
                    wdwytd_US$interest_over_time,
                    wdwytdpy_US$interest_over_time,
                    usfytd_US$interest_over_time,
                    usfytdpy_US$interest_over_time,
                    swoytd_US$interest_over_time,
                    swoytdpy_US$interest_over_time)

fl_ytd <- bind_rows(llfytd_FL$interest_over_time,
                    llfytdpy_FL$interest_over_time,
                    wdwytd_FL$interest_over_time,
                    wdwytdpy_FL$interest_over_time,
                    usfytd_FL$interest_over_time,
                    usfytdpy_FL$interest_over_time,
                    swoytd_FL$interest_over_time,
                    swoytdpy_FL$interest_over_time)

ww_wks <- bind_rows(llfwks_WW$interest_over_time, #LLF wks
                    llfwkspy_WW$interest_over_time,    #LLF PY
                    wdwwks_WW$interest_over_time,      #WDW wks
                    wdwwkspy_WW$interest_over_time,    #WDW PY
                    usfwks_WW$interest_over_time,      #USF wks
                    usfwkspy_WW$interest_over_time,    #USF PY
                    swowks_WW$interest_over_time,      #SWO wks
                    swowkspy_WW$interest_over_time)    #SWO PY

us_wks <- bind_rows(llfwks_US$interest_over_time,
                    llfwkspy_US$interest_over_time,
                    wdwwks_US$interest_over_time,
                    wdwwkspy_US$interest_over_time,
                    usfwks_US$interest_over_time,
                    usfwkspy_US$interest_over_time,
                    swowks_US$interest_over_time,
                    swowkspy_US$interest_over_time)

fl_wks <- bind_rows(llfwks_FL$interest_over_time,
                    llfwkspy_FL$interest_over_time,
                    wdwwks_FL$interest_over_time,
                    wdwwkspy_FL$interest_over_time,
                    usfwks_FL$interest_over_time,
                    usfwkspy_FL$interest_over_time,
                    swowks_FL$interest_over_time,
                    swowkspy_FL$interest_over_time)

################ EXTRAS ########################################

write.csv(ww_ytd,"WorldWide_GT_YTD.csv")
write.csv(us_ytd,"UnitedStates_GT_YTD.csv")
write.csv(fl_ytd,"Florida_GT_YTD.csv")
write.csv(ww_wks,"WorldWide_GT_wks.csv")
write.csv(us_wks,"UnitedStates_GT_wks.csv")
write.csv(fl_wks,"Florida_GT_wks.csv")