# Solar system

# Create a Planet class with a name attribute.
class Planet
  attr_reader :name, :distance_from_sun #don't need to individually access :moons, :rings, :diameter, :species, :solar_rotation
  # Planets are created with data in planet_hash given as argument
  def initialize(planet_hash)
    @name              = planet_hash[:name]
    @moons             = planet_hash[:moons]
    @rings             = planet_hash[:rings]
    @diameter          = planet_hash[:diameter]
    @species           = planet_hash[:species]
    # Give each planet a rate of solar rotation
    @solar_rotation    = planet_hash[:solar_rotation]
    # Give each planet a @distance_from_the_sun attribute
    @distance_from_sun = planet_hash[:distance_from_sun]
  end
# Provide the user with well formatted information about the planet (diameter, mass, number of moons, primary export, etc.)
  def facts
    puts "1. The planet's name is #{ @name }."
    puts "2. Its diameter is #{ @diameter.to_s } miles."
    puts "3. It has #{ @moons.to_s } moon(s)."
    puts "4. It has #{ @rings.to_s } ring(s)."
    puts "5. It is home to the following species: #{ @species }."
    puts "6. A day on planet #{ @name } lasts #{ @solar_rotation.to_s } hour(s)."
    puts "7. It is #{ @distance_from_sun.to_s } astronomical units from the sun."
  end
  # Using this data, add a method to determine the distance from any other planet
  def distance_btwn(other_planet)
    (@distance_from_sun - other_planet.distance_from_sun).abs
  end
end

# Create a SolarSystem class that has an attribute planets that has zero to many Planet instances.
class SolarSystem
  # SolarSystems are created with Planets in planets_array given as argument
  attr_reader :planets, :num_planets
  def initialize(planets_array)
    @planets = planets_array
    @num_planets = planets_array.length
  end
  # lists single Planets in solar system
  def list
    puts "Total planets: #{@num_planets}"
    @planets.each_with_index do |planet, index|
      puts  "#{index + 1}. #{ planet.name }"
    end
  end
  # adds single Planet to solar system
  def add_planet(planet_hash)
    @planets << planet_hash
    @num_planets += 1
  end
end

# planets hash filled with our solar system data
planets = [{
  name: "Mercury",
  moons: 0,
  rings: 0,
  diameter: 3032,
  species: ["mercurial goats", "extreme antelopes"],
  solar_rotation: 1408.8,
  distance_from_sun: 0.39
},
{
  name: "Venus",
  moons: 0,
  rings: 0,
  diameter: 7520.8,
  species: ["volcano people", "cloud beings"],
  solar_rotation: 5832.6,
  distance_from_sun: 0.723
},
{
  name: "Earth",
  moons: 1,
  rings: 0,
  diameter: 7917.5,
  species: ["humans", "sloths", "horses", "polar bears", "cuttlefish"],
  solar_rotation: 24,
  distance_from_sun: 1
},
{
  name: "Mars",
  moons: 2,
  rings: 0,
  diameter: 4212,
  species: ["martians", "mer-martians", "martian pugs"],
  solar_rotation: 24.672,
  distance_from_sun: 1.524
},
{
  name: "Jupiter",
  moons: 67,
  rings: 3,
  diameter: 86881.4,
  species: ["sentient helium balloons"],
  solar_rotation: 9.84,
  distance_from_sun: 5.203
},
{
  name: "Saturn",
  moons: 62,
  rings: 7,
  diameter: 72367.4,
  species: ["giant koala bears", "tiny lions"],
  solar_rotation: 10.2,
  distance_from_sun: 9.539
},
{
  name: "Uranus",
  moons: 27,
  rings: 13,
  diameter: 72367.4,
  species: ["rainbow unicorns", "monochrome dragons", "ombre griffons"],
  solar_rotation: 17.9,
  distance_from_sun: 19.18
},
{
  name: "Neptune",
  moons: 14,
  rings: 5,
  diameter: 30200,
  species: ["ice amoeba", "snow bacteria"],
  solar_rotation: 19.1,
  distance_from_sun: 30.06
}]
# planets hash filled with imaginary planets data
cooler_planets = [{
  name: "Tallon IV",
  moons: 4,
  rings: 2,
  diameter: 7700,
  species: ["Samus", "chozo", "space pirates"],
  solar_rotation: 40.2,
  distance_from_sun: 2
},
{
  name: "Krypton",
  moons: 12,
  rings: 1,
  diameter: 11876.25,
  species: ["superpeople", "superdogs", "supermonkeys", "superhorses", "supercats"],
  solar_rotation: 36.7,
  distance_from_sun: 3.2
},
{
  name: "Palaven",
  moons: 2,
  rings: 0,
  diameter: 5586.127,
  species: ["turians"],
  solar_rotation: 28.3,
  distance_from_sun: 1.15
},
{
  name: "Thessia",
  moons: 0,
  rings: 0,
  diameter: 7381.89,
  species: ["asari"],
  solar_rotation: 27.6,
  distance_from_sun: 0.94
}]

# loops through planets array to create planet objects from each planet hash and adds to array to be added to SolarSystem
my_solar_system = []
planets.each do |planet_hash|
  my_solar_system << Planet.new(planet_hash)
end

# same as above, creates second array of Planets
cool_system = []
cooler_planets.each do |planet_hash|
  cool_system << Planet.new(planet_hash)
end

# milky way holds an array of Planets
milky_way = SolarSystem.new(my_solar_system)
puts "Welcome to our program featuring very true and 100% correct all the time facts about our solar system! Here's a list of the planets in the solar system we live in:"
milky_way.list

# adds Planets from the cool_system array to the milky way SolarSystem
cool_system.each do |planet_obj|
  milky_way.add_planet(planet_obj)
end

# sorts milky way planets by distance from the sun
# how can I do this without milky_way_sort_array variable?
# is it better to make a Planet or SolarSystem sort method?
milky_way_sort_array = milky_way.planets.sort_by { |fact| fact.distance_from_sun }
milky_way = SolarSystem.new(milky_way_sort_array)

puts "Oh hey, we discovered a few more planets! You can learn about the following amazing planets: "

milky_way.list

learn = nil
until learn == "q"
  # ask the user to select a planet they'd like to learn about.
  puts "Now, which planet would you like to learn about? Type 'q' to move on to the next activity."
  learn = gets.chomp.downcase
  case learn
  when "mercury", "1"
    milky_way.planets[0].facts
  when "venus", "2"
    milky_way.planets[1].facts
  when "thessia", "3"
    milky_way.planets[2].facts
  when "earth", "4"
    milky_way.planets[3].facts
  when "palaven", "5"
    milky_way.planets[4].facts
  when "mars", "6"
    milky_way.planets[5].facts
  when "tallon iv", "7"
    milky_way.planets[6].facts
  when "krypton", "8"
    milky_way.planets[7].facts
  when "jupiter", "9"
    milky_way.planets[8].facts
  when "saturn", "10"
    milky_way.planets[9].facts
  when "uranus", "11"
    milky_way.planets[10].facts
  when "neptune", "12"
    milky_way.planets[11].facts
  when "q"
    puts "Hope you learned a bunch!"
  # Then ask the user for another planet.
  else
    puts "Please enter one of the planets from the list."
  end
end

# prompts user to enter two planets to determine distance
print "Now, wanna find out the distance between two planets?\nEnter the number of the first planet: "
input1 = gets.chomp.to_i
print "Enter the number of the second planet: "
input2 = gets.chomp.to_i
puts "Planet #{milky_way.planets[input1 - 1].name} and planet #{milky_way.planets[input2 - 1].name} are #{milky_way.planets[input1 - 1].distance_btwn(milky_way.planets[input2 - 1])} astronomical units (AU) apart. Whoooa, far out!"

# Wave 2
# Optional Enhancements
# Give your solar system a formation year (in earth years).
# Define a method that returns the local year of the planet based on it's rotation since the beginning of the solar system
