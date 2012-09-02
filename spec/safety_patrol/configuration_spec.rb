require 'spec_helper'


describe SafetyPatrol::Configuration do
	
	it "should all you to set abilities" do
		configuration = SafetyPatrol::Configuration.new
		configuration.abilities[:send] = 'sendable'
		configuration.abilities[:send].should eq('sendable')
	end

end