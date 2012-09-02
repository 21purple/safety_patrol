require 'spec_helper'

class ArticleAuthorizer

	def creatable_by?(user, resource)
		true
	end

end

class Article
	include SafetyPatrol::Abilities
	authorizer 'ArticleAuthorizer'
end

describe SafetyPatrol::Abilities do

	it "should define methods on a class based upon the abilities hash" do
		article = Article.new
		lambda {
			article.creatable_by?
		}.should_not raise_exception(NoMethodError)
	end

	it "should have an associated Authorizer" do
		Article.authorizer.should be_instance_of(ArticleAuthorizer)
	end

	it "should receive a creatable_by? call and return true or false" do
		article = Article.new
		user = double("User")
		article.creatable_by?(user).should eq(true)
	end

	describe ArticleAuthorizer do

		it "should receive a creatable_by?" do
			article = Article.new
			article.authorizer.should_receive(:creatable_by?)
			user = double("User")
			article.creatable_by?(user)
		end
	end

end