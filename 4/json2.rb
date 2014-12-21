require 'rubygems'
require 'json'

RESPONSE='{"person":{"personal_data":{"name": "Nataly", "gender":"female", "age":22},
"social_profiles":["https://www.facebook.com/janataliia", ""],
"additional_info":{"hobby":["skiing", "travelling"]}}}'

response = JSON.parse(RESPONSE, :quirks_mode => true)


Person = Struct.new(*response["person"].keys.collect(&:to_sym)) do

    def name
    #  ((response["person"].key? personal_data)&&(personal_data['name'])) ? personal_data['name'] : 'Unnamed user'
      if (defined? personal_data)&&(personal_data['name'])
        personal_data['name']
      end
    end

    def adult?
    #  if personal_data["age"].slice[/[^\d\.]/]
      personal_data["age"] >= 21 ? 'adult' : 'child'
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
          puts social_profiles
        end
    end

    def hobbies
      puts additional_info['hobby']
    end
end


person = Person.new(*response["person"].values)
puts "Hello #{person.name}!"

p person.adult?

puts "Gender: #{person.gender}"
person.social_profiles?
person.hobbies
