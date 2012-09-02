require 'spec_helper'

class User
	include SafetyPatrol::UserAbilities
end

class UserItemAuthorizer

	def creatable_by?(user, resource)
		true
	end

	def deletable_by?(user, resource)
		false
	end

end

class UserItem
	include SafetyPatrol::Abilities
	authorizer UserItemAuthorizer
end

describe SafetyPatrol::UserAbilities do

	it "should define methods on a User class based upon the abilities hash" do
		user = User.new
		article  = double("article")
		article.should_receive(:creatable_by?)
		lambda {
			user.can_create? article
		}.should_not raise_exception(NoMethodError)
	end

	it "#can_create? should return true" do
		user = User.new
		user_item = UserItem.new
		user.can_create?(user_item).should eq(true)
	end

	it "#can_delete? should return false" do
		user = User.new
		user_item = UserItem.new
		user.can_delete?(user_item).should eq(false)
	end

end