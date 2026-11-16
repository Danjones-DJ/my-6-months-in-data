source("R/packages.R")
source("R/source-url.R")
source("R/load_and_format_data.R")
source("R/summary_stats.R")
source("R/dashboard.R")

data = read_sheet(url)
current_output = load_and_format_data(data)
dashboard(current_output)
summary_stats(current_output)

