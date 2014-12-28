require 'rubygems'
require 'json'

RESPONSE='{"person":{"personal_data":{"name": "Nataly", "gender":"female", "age":22},
"social_profiles":["https://www.facebook.com/janataliia", ""],
"additional_info":{"hobby":["skiing", "travelling"]}}}'

response = JSON.parse(RESPONSE, :quirks_mode => true)


Person = Struct.new(*response["person"].keys.collect(&:to_sym)) do

    def name
#      ((self.has_key?("personal_data"))&&(personal_data['name'])) ? personal_data['name'] : 'Unnamed user'
    #  if pers.key?("personal_data")
      if (defined? personal_data)&&(personal_data['name'])
        personal_data['name']
      end
    #    end
    end

    def adult?
    #  if personal_data["age"].slice[/[^\d\.]/]
      personal_data["age"] >= 21 ? 'adult' : 'child'
     # else 'age '
     # end

    end

    def gender
        if (defined? personal_data)&&(personal_data['gender'])
            personal_data["gender"]
        else "not defined"
        end
    end

    def social_profiles?
        if defined? social_profiles
          social_profiles
          else puts "A person doesn't have any social profiles"
        end
    end

    def hobbies
      if has_key?("hobby")
      additional_info['hobby']
        end
    end
end


person = Person.new(*response["person"].values)
puts "Hello #{person.name}!"
p person.adult?
puts "Gender: #{person.gender}"
puts "Social profiles: #{person.social_profiles?}"
puts "Hobbies: #{person.hobbies}"