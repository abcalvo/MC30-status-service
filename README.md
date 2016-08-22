# MC30-status-service
Madrid Calle 30 (MC30) JSON status is a microservice written in Ruby using Sinatra and Nokogiri to get the status of Madrid Calle 30 motorway.

The microservice obtains the data from the website [mc30.es](http://www.mc30.es/), and parses and converts it to JSON format:
```json
{
  "last_update": "2016-08-22T20:02:00+02:00",
  "total_cars_in_tunnel": "898",
  "total_cars_in_mc30": "4307",
  "alerts": [
    "NINGÚN TRAMO CON RETENCIONES",
    "NINGÚN TRAMO CON TRÁFICO LENTO"
  ]
}
```

## JSON Schema
* last_update: Date. When was the last update of data published by [mc30.es](http://www.mc30.es/).
* total_cars_in_tunnel: Number. Total cars throughout Madrid Calle 30's tunnel.
* total_cars_in_mc30: Number. Total cars throughout the whole Madrid Calle 30 motorway.
* alerts: Array of strings. Sections with traffic jams and sections with congestion.
 * Whether there aren't traffic jamed sections, the microservice returns "NINGÚN TRAMO CON RETENCIONES" ("NO TRAFFIC JAMMED SECTIONS")
 * Whether there aren't congested sections, the microservice returns "NINGÚN TRAMO CON TRÁFICO LENTO" ("NO CONGESTED SECTIONS")
