# SafetyPatrol (BETA)
Simple framework agnostic Authorization gem.  It was heavily (start the copiers) influenced by the Authority gem, but I wanted a core authorization gem that was not tied to a specific web framework. 

## Installation

Add this line to your application's Gemfile:

    gem 'safety_patrol'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install safety_patrol

## Usage

	#configure it
	SafetyPatrol.configure |config|
						#verb	 #adjective
		config.abilities[:send] = :sendable

		#the default abilities are:
		#:create => :creatable
		#:read   => :readable
		#:update => :updatable
		#:delete => :deletable
	end

	#define a User class and include the SafetyPatrol::UserAbilities module
	class User
		include SafetyPatrol::UserAbilities
		attr_accessor :role
		def admin?
			role == 'admin'
			# or whatever logic fits your apps needs
		end
	end


	#define a class that you want to provide authorization logic for 
	#and include SafetyPatrol::Abilities module and declare the authorizer class
	class Article
		include SafetyPatrol::Abilities
		authorizer 'ArticleAuthorizer'
	end

	#define you authorizer class that contains the authorization logic
	class ArticleAuthorizer

		#define methods that follow the convention of adjective_by?(user, resource)

		#these methods with receive the user and resource
		def creatable_by?(user, article)
			user.admin?
		end
	end

	#check for a user's authorization
	admin = User.new
	admin.role = 'admin'

	guest = User.new
	guest.role = 'guest'

	article = Article.new

	guest.can_create?(article) # return false
	admin.can_create?(article) # return true

	article.creatable_by(admin) #return true
	article.creatable_by(guest) #return false

	#What everything boils down to is SafetyPatrol is just providing sugar on top of this:
	authorizer = ArticleAuthorizer.new
	authorizer.creatable_by?(admin, article) #return true


##Todos
1. Add more specs
2. Repeat #1

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
