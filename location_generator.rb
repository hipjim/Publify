input_file = "C:\\Users\\cristian.popovici\\Desktop\\cities.txt"
output_file = "C:\\Users\\cristian.popovici\\Desktop\\output.txt"

f = File.open(input_file, "r")

class Location

  attr_accessor :name, :lat, :long

  def initialize(tokens)
    @name = tokens[2].strip
    @lat = tokens[4].strip
    @long = tokens[5].strip
  end

  def to_sql
    "INSERT INTO locations VALUES(null, \'#{@name}\', #{@lat}, #{@long});"
  end

end

locations = []
f.each_line do |line|
  tokens = line.split(',')
  if tokens[0] == "ro"
    l = Location.new(tokens)
    locations.push(l.to_sql)
  end
end

File.open(output_file, 'w') do |f|
  locations.each { |location| f.puts location; }
end