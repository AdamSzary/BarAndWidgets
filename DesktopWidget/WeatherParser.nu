#!/usr/bin/nu

$env.WeatherTable = (http get "openmeteo link goes here")

print (["Temp: ", $env.WeatherTable.current.temperature_2m, " °C"] | str join)
print (["Wind: ", $env.WeatherTable.current.wind_speed_10m, " m/s"] | str join)
print (["Rain: ", $env.WeatherTable.current.rain, " mm"] | str join)