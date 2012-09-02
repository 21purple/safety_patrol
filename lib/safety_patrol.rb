require "safety_patrol/version"
require "safety_patrol/configuration"

module SafetyPatrol
  
  	class << self

    	def abilities
    		configuration.abilities.freeze
    	end

    	def verbs 
    		abilities.keys
    	end

    	def adjectives 
    		abilities.values
    	end

    	attr_accessor :configuration

    	def configure
    		self.configuration ||= Configuration.new
	   	 	yield(configuration) if block_given?
	    	require 'safety_patrol/user_abilities'
    		require 'safety_patrol/abilities'
	    	configuration
		end

  	end

end
