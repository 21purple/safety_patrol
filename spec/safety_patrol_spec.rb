require 'spec_helper'


describe SafetyPatrol do
	
	it "should present a configuration object via a block" do
		configuration = nil
		SafetyPatrol.configure do |config|
			configuration = config			
		end
		configuration.should be_instance_of(SafetyPatrol::Configuration)
	end


	describe "Abilities" do

		before do
			SafetyPatrol.configure do |config|
			end
		end

		it "should provide a list of ability verbs" do
			SafetyPatrol.verbs.should eq([:create, :read, :update, :delete])
		end

		it "should provide a list of ability verbs" do
			SafetyPatrol.adjectives.should eq([:creatable, :readable, :updatable, :deletable])
		end

	end


end