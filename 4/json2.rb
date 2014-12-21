require 'rubygems'
require 'json'

RESPONSE='{"person":{"personal_data":{"name": "Nataly", "gender":"female", "age":18},
"social_profiles":["https://www.facebook.com/janataliia"],
"additional_info":{"hobby":["skiing", "travelling"]}}}'

response = JSON.parse(RESPONSE, :quirks_mode => true)


Person = Struct.new(*response["person"].keys.collect(&:to_sym)) do
    def name
        if (defined? personal_data)&&(personal_data['name'])
            nam=personal_data['name']
        end
    end

    def adult?
        personal_data["age"] >= 21
    end

    def gender
        if (defined? personal_data)&&(personal_data['gender'])
            puts (personal_data["gender"])
        else puts "The user didn't say"
        end
    end

    def facebook_addr
        if defined? social_profiles
            social_profiles.each do |social_profile|
            end
        end
    end

    def hobbies?
        has_hobby = false
        if defined?(additional_info) && additional_info['hobby']
            has_hobby = true
        end
        has_hobby
    end
end


person = Person.new(*response["person"].values)
puts "Hello #{person.name}!"
p person.adult?
person.gender
person.facebook_addr
p person.hobbies?
