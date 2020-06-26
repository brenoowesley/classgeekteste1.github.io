class UserAttribute < ApplicationRecord
  belongs_to :user


  def add_attribute(attribute_name, amount)
  	amount = amount.to_i
  	case attribute_name
	when "money"
	  	self.money+=amount
	
	when "hp"
		self.hp += amount
	  	if self.hp >= 50
	  		self.hp = 50
	  	end
	  when "mana"
	  	self.mana += amount
	  	if self.hp >= 30 
	  		self.hp = 30
	  	end
	  when "xp"
	  	self.xp += amount
	  	upLevel = (self.xp / 1024).to_i
	  	self.xp = self.xp % 1024
	  	self.level += upLevel

	end

  end	
end
