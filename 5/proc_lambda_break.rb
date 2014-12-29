require 'rubygems'
require 'json'

RESPONSE='{"person":{"personal_data":{"name": "Nataly", "gender":"female", "age":22},
"social_profiles":["https://www.facebook.com/janataliia", ""],
"additional_info":{"hobby":["skiing", "travelling"],

"pets":[{"name":"Mitten","species":"cat"},
{"name":"Brinkley","species":"dog"},
{"name":"Toyota","species":"snail"}]

}}}'

response = JSON.parse(RESPONSE, :quirks_mode => true)

Person = Struct.new(*response["person"].keys.collect(&:to_sym)) do
    def name
        if (personal_data.key?('name'))
            personal_data['name']
        else
            nil
        end
    end

    def adult?
        if (personal_data.key?('age'))
            personal_data['age'] >= 21
        else
            nil # also falsy, which is good - we are on a safe side!
        end
    end

    def gender
        if (personal_data.key?('gender'))
            personal_data['gender']
        else 
            nil
        end
    end

    # by substring
    def has_social_network(substr)
        social_profiles.each { |x| 
            if x.downcase().index(substr)
                return true
            end
        }
        false
    end

    def has_facebook?
        self.has_social_network("facebook.com")
    end

    def has_vk?
        self.has_social_network("vk.com")
    end


    def hobbies
        additional_info['hobby']
    end


    def pets
      additional_info['pets']
    end

end


class PetsFactory

  def self.create_pet(name, species, &block)

    pet_name = name

    ->(own_block) do
      yield
      own_block.call
      p "I'm #{pet_name}, and I am a  #{species}"
    end
  end

  
end

class Playground

  attr_accessor :pets

  def initialize(pet)

    self.pets = []
    pet.each do |pet|
      pets.push PetsFactory.create_pet(pet[:name], pet[:species]) { p "I`m glad to play, my name is #{self.name}" }
      if pet.has_key?(:name) && pet.has_key?(:species)
    end
  end

  def call_over(actions)
    self.pets.each_with_index { |pet, index| pet.call(actions[index]) }
  end
  end
end

person = Person.new(*response["person"].values)

  pets=person.pets

  playground = Playground.new(pets)

  p_actions = []
  p_actions.push -> { p "Meow meow!" }
  p_actions.push -> { p "Woof!" }
  p_actions.push -> { p "Squeak!" }

playground.call_over(p_actions)


puts "Hello #{person.name}!"
puts person.adult?
puts "Gender: #{person.gender}"
puts "Has facebook? : #{person.has_facebook?}"
puts "Has vk? : #{person.has_vk?}"
puts "Hobbies: #{person.hobbies}"
puts "I have pets: #{person.pets}"