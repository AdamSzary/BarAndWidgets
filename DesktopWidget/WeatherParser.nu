#!/usr/bin/nu

$env.WeatherTable = (http get "https://api.open-meteo.com/v1/forecast?latitude=50.8075&longitude=20.9633&models=dwd_icon_seamless&current=temperature_2m,rain,wind_speed_10m&forecast_days=7&wind_speed_unit=ms")

print (["Temp: ", $env.WeatherTable.current.temperature_2m, " °C"] | str join)
print (["Wind: ", $env.WeatherTable.current.wind_speed_10m, " m/s"] | str join)
print (["Rain: ", $env.WeatherTable.current.rain, " mm"] | str join)