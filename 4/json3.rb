require 'rubygems'
require 'json'

RESPONSE='{"person":{"personal_data":{"name": "Nataly", "gender":"female", "age":22},
"social_profiles":["https://www.facebook.com/janataliia", ""],
"additional_info":{"hobby":["skiing", "travelling"]}}}'

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

    #def hobbies
        #additional_info['hobby']
    #end
end
person = Person.new(*response["person"].values)
puts "Hello #{person.name}!"
puts person.adult?
puts "Gender: #{person.gender}"
puts "Has facebook? : #{person.has_facebook?}"
puts "Has vk? : #{person.has_vk?}"
#puts "Hobbies: #{person.hobbies}"