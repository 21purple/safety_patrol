module SafetyPatrol

	module Abilities

		def self.included(base)
    		base.extend ClassMethods
  		end

		module ClassMethods

			attr_accessor :_authorizer

			def authorizer(object = nil)
				if object.nil?
					self._authorizer
				else
					self._authorizer = (object.is_a?(String)) ? Kernel.const_get(object).new : object.new
				end
			end		

		end

		SafetyPatrol.adjectives.each do |adjective|
			define_method(("#{adjective}_by?").intern) do |user|
				self.authorizer.send(("#{adjective}_by?").intern, user, self)
			end
		end		

		def authorizer 
			self.class.authorizer
		end

	end

end

