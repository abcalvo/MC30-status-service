require 'nokogiri'
require 'open-uri'
require 'json'

class MC30
  MC30_URL = 'http://mc30.es/'

  # Parse traffic data and returns JSON
  def self.status
      doc = Nokogiri::HTML(open(MC30_URL))

      traffic_data = doc.css('.trafico')

      # Parse HTML, and get only the cars in tunnel:
      # COCHES CIRCULANDO TÚNEL: 2583 => 2583 (regexp \d+)
      total_cars_in_tunnel =
        traffic_data.css('.width60.trafico_fechas .width60 h4').text
        .match(/\d+/)

      # Parse HTML, and get only the cars in MC30:
      # TOTAL CALLE 30: 13070 => 13070 (regexp \d+$)
      total_cars_in_mc30 =
        traffic_data.css('.width60.trafico_fechas .width40 h4').text
        .match(/\d+$/)

      # Parse HTML, and get last update
      last_update =
        DateTime.parse(traffic_data.css('.width40.trafico_fechas p > text()').text)

      # Parse HTML, and get the traffic alerts
      alerts = Array.new
      traffic_data.css('#slides p').each do |slide|
        alerts << slide.text
      end

      data = {
        last_update: last_update,
        total_cars_in_tunnel: total_cars_in_tunnel,
        total_cars_in_mc30: total_cars_in_mc30,
        alerts: alerts
      }

      JSON.pretty_generate(data)
  end
end
