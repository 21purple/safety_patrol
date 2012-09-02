module SafetyPatrol

	module UserAbilities

		#define some method on the user for convenience
		SafetyPatrol.verbs.each do |verb|
		  class_eval <<-RUBY, __FILE__, __LINE__ + 1
		    def can_#{verb}?(resource)
		      resource.#{SafetyPatrol.abilities[verb]}_by?(self)
		    end
		  RUBY
		end
		
	end

end


    