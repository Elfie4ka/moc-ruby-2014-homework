require 'rubygems'
require 'json'

RESPONSE='{"person":{"personal_data":{"name": "Nataly", "gender":"female", "age":21},
"social_profiles":["http://www.facebook.com/janataliia"],
"additional_info":{"hobby":[], "pets":[{"name":"Mittens","species":"Felis silvestris catus"}]}}}'

response = JSON.parse(RESPONSE, :quirks_mode => true)

Person = Struct.new(*response["person"].keys.collect(&:to_sym)) do

  def greeting
    if (defined? personal_data)&&(personal_data['name'])
      name=personal_data['name']
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

  def hobbies?
    puts additional_info['hobby']
    additional_info['hobby'].to_s.empty?
  end
end

person = Person.new(* response["person"].values)
person.greeting
p person.adult?
person.gender
#p person.facebook_addr
p person.hobbies?