require("cronR")

# list the contents of a cron tab
cron_ls()

# list the full path of where the script is
path = "/Users/allanabala/Desktop/traffic-data/traffic_maps.R"

# create a command to execute an R-script
cmd = cron_rscript(path)

# add the command and specify the days/times to start
cron_add(command = cmd, frequency = 'daily', at = "18:00", days_of_week = c(0:7),
         id = 'traffic_maps', description = 'daily downloads of traffic maps from google')

# remove it by id
cron_rm(id = 'traffic_maps')

# cron schedule for days of the week:
# 0 - Sunday
# 1 - Monday
# 2 - Tuesday
# 3 - Wednesday
# 4 - Thursday
# 5 - Friday
# 6 - Saturday



