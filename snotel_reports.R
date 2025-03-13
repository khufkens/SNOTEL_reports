# loads required libraries
library(snotelr)
library(dplyr)

# lists all sites
sites <- snotel_info()

# download loop
# could be parallelized but
# might trigger a rate limiter
# so be careful with parApply()
# if you implement it
snotel_data <- lapply(
  sites$site_id,
  function(id){
    tryCatch(
      expr = snotel_download(
        site_id = id,
        internal = TRUE
      ),
      error = function(e){return(NULL)}
    )
  }
)

# One can flatten everything, this results
# into a table of 12M rows and 19 columns
# ~2.5GB in size
snotel_data <- bind_rows(snotel_data)

# save as RDS and compress
# to reduce the file size
# compressed ~50MB
saveRDS(
  snotel_data,
  "snotel_reports.rds",
  compress = "xz"
)
