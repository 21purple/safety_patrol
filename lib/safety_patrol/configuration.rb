module SafetyPatrol

	class Configuration

		attr_accessor :abilities

		def initialize
			
			@abilities = {
				#verb		#adjective
			    :create => :creatable,
			    :read   => :readable,
			    :update => :updatable,
			    :delete => :deletable
			}

		end

	end


end