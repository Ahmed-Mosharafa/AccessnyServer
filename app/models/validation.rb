require 'securerandom'
class Validation < ActiveRecord::Base
  attr_accessible :encoded_id, :tag_id
  def self.add_tag(parameters)
  	return Validation.new(:encoded_id => Validation.generate_hash8(parameters[:tag_id])	)
  end
  def self.generate_hash8(tag_id)
  	generated = SecureRandom.hex(4)
  	if (Validation.find_by_encoded_id(generated) == nil)
  		return generated
	else
		Validation.generate_hash8(tag_id)
	end
  end
end
