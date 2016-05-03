
require 'barometer'

class Weekday
  def today
    time = Time.now.strftime('%e').strip
  end
end

def weather_future(weather)

  aday = Weekday.new.today
  next_day = aday.to_i.next.to_s

  weather.forecast.each do|forecast|
    the_day = forecast.starts_at.strftime('%e').strip

    if the_day == aday
      day = "Today"
    elsif the_day == next_day
      day = "Tomorrow"
    else
      day = forecast.starts_at.strftime('%A')
    end

  puts "The weather for #{day} will be\n
  High: #{forecast.high},\n
  Low: #{forecast.low},\n
  #{forecast.icon}
  "
end
end


puts "what is your location? zip/postal code or city, state - province."

barometer = Barometer.new(gets.chomp)

weather = barometer.measure

weather_future(weather)
