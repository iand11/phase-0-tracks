# Virus Predictor

# I worked on this challenge [by myself, with: Shea Thomas ].
# We spent [2] hours on this challenge.

# EXPLANATION OF require_relative
# Require_relative is used to call data from separate files, allowing access to data from the same directory. Require is used to for ruby modules and gems.
#
require_relative 'state_data'

class VirusPredictor
#responsible for declaring @state, @population, and @population_density variables and their values.
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @i = 0
  end
#responsible for declaring predicted_deaths and speed_of_spread methods and their arguments.
  
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private
#responsible for taking population_density, population, and state and calling them to produce a value for number_of_deaths for each state.
  def predicted_deaths
    # predicted deaths is solely based on population density
 
 #refactored by creating instance variable for i and removing the equation for number_of_deaths from each number

    if @population_density >= 200
     @i = 0.4
    elsif @population_density >= 150
     @i = 0.3
    elsif @population_density >= 100
     @i = 0.2
    elsif @population_density >= 50
     @i = 0.1
    else
     @i = 0.05
    end


number_of_deaths = (@population * @i).floor
    

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end
#responsible for taking population_density and state and providing a value for speed in months that the outbreak will spread for each state.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.


#refactored by removing speed = 0 and removing the + from the +=

    if @population_density >= 200
      speed = 0.5
    elsif @population_density >= 150
      speed = 1
    elsif @population_density >= 100
      speed = 1.5
    elsif @population_density >= 50
      speed = 2
    else
      speed = 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects

STATE_DATA.each do |state_name, value|
 state_name = VirusPredictor.new("#{state_name}", value[:population_density], value[:population])
 state_name.virus_effects
end 

#=======================================================================
# Reflection Section