## https://cran.r-project.org/web/packages/mafs/mafs.pdf

library(mafs)


apply_all_models(austres,6)


apply_selected_model(AirPassengers, "auto.arima", 6)


available_models()


error_metrics()


gg_fit(AirPassengers, 12, "snaive")


select_forecast(austres, 6, 12, "MAPE")

