require 'time'

Date_of_birth = '1986-2-13'

def humanize secs
  [ 
    [60, :seconds], 
    [60, :minutes], 
    [24, :hours], 
    [365.25, :days], 
    [100, :years]
  ].map do |count, name|
    if secs > 0
      secs, n = secs.divmod(count)
      "#{n.to_i} #{name}"
    end
  end.compact.reverse.join(' ')
end


distance = Time.new - Time.parse(Date_of_birth)
puts humanize(distance)+"\r"
