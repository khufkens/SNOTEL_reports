# SNOTEL reports

This tiny script grabs USDA SNOTEL reports
for safekeeping and re-analysis. SNOTEL monitors 
snow and water across the (western) US.

https://www.nrcs.usda.gov/resources/data-and-reports/snow-and-water-interactive-map

The data downloaded are the historical reports
summarizing daily values of snow pack and additional
metrics. Reports lag real-time values with a couple
of weeks.

The script generates one big table with 12M rows and 19
columns (variables). Data can be post-processed for both
the timing of snow accummulation and amount using the
{snotelr} R package. The data included in this repository
as a compressed `snotel_reports.rds` file was last updated
12 Mar. 2025. Use the R `readRDS()` function to access the data.

```r
snotel_data <- readRDS("snotel_reports.rds")
```

> [!NOTE]
> Please cite the data from the USDA the National Water and Climate Center as:
> 
> United States, US Department of Agriculture, Natural Resource Conservation Service, National Water and Climate Center. (2024, February 29). Air and Water Database. Water and Climate Information System. https://nwcc-apps.sc.egov.usda.gov/
>
> Schaefer, G. L., & Paetzold, R. F. (2001). SNOTEL (SNOwpack TELemetry) and SCAN (soil climate analysis network). Automated weather stations for applications in agriculture and water resources management: current use and future perspectives, 1074, 187-194.
