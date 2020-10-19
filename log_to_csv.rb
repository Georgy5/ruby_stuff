require 'csv'

# Read GPS log
# "gps_log.txt"
log_by_date = []

File.foreach("gps_log.txt") do |line|
  pattern = /(\d{2}\.\d{2}\.\d{4}).+([A-Z]\s(Abfahrt|Ankunft))/
  match = line.match(pattern)

  unless match.nil?
    log_by_date << {
      date: match[1],
      line: line,
      type: match[3]
    }
  end
end

# Store CSV
csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
filepath    = 'fahrplan.csv'

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['Datum', 'Fahrtenart', 'Abfahrtsort', 'Ankunftsort', 'Odometer', 'km (Ankunft)', "Hin-/Rückfahrt"]

  log_by_date.each do |element|
    date = element[:date]
    line = element[:line]
    fahrten_art = element[:type]
    
    # arriving pattern = date, type, odometer
    leaving_pattern = /(\d{2}\.\d{2}\.\d{4}).+\s(Abfahrt|Ankunft)[!|?].+(\d{6})/
    # arriving pattern = date, type, km, odometer
    arriving_pattern = /(\d{2}\.\d{2}\.\d{4}).+\s(Ankunft).+(?<=[!|?]\s)(.*)(?=km).+(\d{6})/
    # km_pattern = /(?<=[!|?]\s)(.*)(?=km)/

    linematch = line.match(leaving_pattern)
 
    l_date, l_type, l_odometer = line.match(leaving_pattern).captures unless linematch.nil?

    if l_type.eql?("Abfahrt")
      linematch = line.match(leaving_pattern)
      puts "abfahrt: #{linematch}"
      l_date, l_type, l_odometer = line.match(leaving_pattern).captures
      csv << [l_date, l_type, '', '', l_odometer , '', '']
    elsif linematch.nil?  # don't do anything
    else
      linematch = line.match(arriving_pattern) 
      puts "Anfahrt: #{linematch}"
      a_date, a_type, a_km, a_odometer = line.match(arriving_pattern).captures
      csv << [a_date, a_type, '', '', a_odometer, "#{a_km} (Ankunft)", '']
    end
  end
end
