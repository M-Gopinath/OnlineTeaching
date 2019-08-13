class DateTimeAssist

  def self.current_time
    Time.zone.now.in_time_zone(Time.zone.name)
  end

  def self.convert_into_current_zone(datetime)
    datetime.in_time_zone(Time.zone.name).strftime("%d %b %Y %H:%M:%S")
  end

end
