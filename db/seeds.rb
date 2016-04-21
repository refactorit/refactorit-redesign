# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do

  vanessa = User.create!(email: 'vanessa.serka@refactorit.co', name: 'Vanessa Šerka',
              password: '11223344', password_confirmation: '11223344')
  neven = User.create!(email: 'neven.rakonic@refactorit.co', name: 'Neven Rakonić',
              password: '11223344', password_confirmation: '11223344')
  ivan = User.create!(email: 'ivan.lucev@refactorit.co', name: 'Ivan Lučev',
              password: '11223344', password_confirmation: '11223344')
  filip = User.create!(email: 'filip.defar@refactorit.co', name: 'Filip Defar',
              password: '11223344', password_confirmation: '11223344')

  development = Topic.create!(name: 'Development')
  design = Topic.create!(name: 'Design')
  community = Topic.create!(name: 'Community')

  Post.create!(title: 'Reaching out to community', author: filip,
    status: 1, slug: 'reaching-out-to-community',
    published_at: DateTime.parse('2014-12-01 22:25:38'), topic: community,
    description: (<<~DESC
      Programmers are often portrayed as loners, hacking the code in a dark
      basement and having no contact with living beings except for their cat.
      Fortunately, that is, in most cases, far from the truth. Developer
      communities are thriving all over the world. There’s all kinds of events,
      meetups, drink ups, conferences, anti-conferences and what not.
    DESC
    ),
    body: (<<~BODY
      Programmers are often portrayed as loners, hacking the code in a dark
      basement and having no contact with living beings except for their cat.
      Fortunately, that is, in most cases, far from the truth. Developer
      communities are thriving all over the world. There’s all kinds of events,
      meetups, drink ups, conferences, anti-conferences and what not.

      The reason these kind of events are popular is because they are extremely
      useful (and fun). If you are not attending them, you should. It does not
      matter if you are just starting out. If you are just starting out it’s
      the best time to get involved in the community.

      Instead of explaining why meetups are great I’ll tell you a short story
      about how meeting up with few strangers changed my life.

      Not a long time ago, while I was still in college, I tried organizing a
      Ruby developers club. At that time, meetups still weren’t popular in
      Zagreb, and not many people used Ruby. The idea was that we would meet up
      regularly and work on open source projects, learn from each other and
      experience working in a team. Unfortunately, the project was a complete
      failure. We had two meetups with three people attending, and that was
      about it. Working on a project as a team required significant amount of
      time and we were just too busy doing other stuff.

      However, I stayed in contact with people who attended those meetups and
      two of them, Ivan and Hrvoje, had a great impact on my career.

      Few months later Hrvoje told me that he started freelancing. He explained
      in detail how he managed to get his first clients and what you are
      expected to know. I was interested in freelancing before, but I always
      hought that it’s too hard to break into the industry. His success
      encouraged me to give it a try. And it worked; I started freelancing while
      I was on my last year in college. It was great; I earned some pocket money
      and gained a lot of experience.

      Almost two years later I’ll meet Ivan again. He stumbled upon same
      coworking space that I was working in, so we started catching up. Over
      the next few months, we attended few hackathons and worked on a smaller
      project together. We got along quite well, and one day we decided to join
      forces and start a company together.

      I never looked back at it earlier, but it’s funny how things work out. If
      it wasn’t for that failure of a club I would probably never get into
      freelancing, and definitely wouldn’t have started this dev shop with Ivan.
      Sometimes who you know is more important than what you know - and that is
      why attending community events is extremely important. You just might meet
      your future business partner or employer.
    BODY
    )
  )
  Post.create!(title: 'Ember equivalent of simple_format Rails helper',
    author: filip, status: 1, slug: 'simpleformat-helper-in-ember',
    published_at: DateTime.parse('2015-01-30 22:25:38'), topic: development,
    description: (<<~DESC
      Here’s a rough equivalent of [simple_format](http://apidock.com/rails/ActionView/Helpers/TextHelper/simple_format) helper from Rails. I borrowed
      basic implementation from [Henning Koch](http://makandracards.com/makandra/1395-simple_format-helper-for-javascript).
    DESC
    ),
    body: (<<~BODY
      Here’s a rough equivalent of simple_format helper from Rails. I borrowed
      basic implementation from Henning Koch.

      This version is written in Coffeescript, it escapes given string and
      returns an instance of SafeString.


      ```javascript
      Ember.Handlebars.helper 'simpleFormat', (string) ->
        string = Handlebars.Utils.escapeExpression(string)
        string = string.replace(/\\r\\n?/g, "\\n").trim()
        if string.length > 0
          string = string.replace(/\\n\\n+/g, '</p><p>');
          string = string.replace(/\\n/g, '<br />');
        new Ember.Handlebars.SafeString("<p>#{'string'}</p>")
      ```
    BODY
    )
  )
  Post.create!(title: 'Talk like a pirate with Pirate glyphicons',
    author: vanessa, status: 1, slug: 'pirate-glyphicons',
    published_at: DateTime.parse('2015-04-02 20:14:12'), topic: design,
    description: (<<~DESC
      Grab these custom made glyphicons to make it more piratey.
    DESC
    ),
    body: (<<~BODY
      Grab these custom made glyphicons to make it more piratey.

      Throughout college, I've been a huge fan of typography, and even
      considered studying it at the Type and Media Dept at KABK in The Hague.
      Our mentor, Nikola Djurek has taught us to use the same amount of care
      with designing icons as well as letters.

      Realising there is a lack of pirate glyphicons, I made this, a small
      addition to the basic glyphicons set. After I've generated the glyphs as
      a font with FontLab, I wasn't sure what unicodes to assign to them and
      how to make them easy to use. My holy grail was [icomoon.io]("https://icomoon.io"), which assigns
      unicodes and even prepares a demo html to test the newly generated glyphs.

      To prepare your vectors so that they can function as a glyphicon set, you
      need to make sure that:
      1.  your nodes are in the correct position
      2.  you have the smallest possible amount of nodes to make the desired effect
      3.  make sure the weights are the same on each of them
      4.  approximately define the same size for all the glyphs
      5.  merge all overlapping vectors before generating
      Download the pirate glyphicons set [here](http://www.refactorit.co/files/pirate-glyphicons.zip)
      #
      ![pirate glyphicons](http://www.refactorit.co/images/pirate.jpg)
    BODY
    )
  )
  Post.create!(title: 'The Spicy Octo Bootstrap Theme',
    author: vanessa, status: 1, slug: 'the-spicy-octo-theme',
    published_at: DateTime.parse('2015-06-26 12:00:00'), topic: design,
    description: (<<~DESC
      The Spicy Octo Theme is an easily adjustable Bootstrap template.
    DESC
    ),
    body: (<<~BODY
      The Spicy Octo Theme is an easily adjustable Bootstrap template.

      Contains the most essential parts for presenting a startup or a small
      company. Completely responsive, includes Font Awesome icons and a Google
      map. The color scheme is in grayscale so it’s highly adaptable for various
      purposes.

      * Snatch on [Github](http://github.com/vanessazoyd/The-Spicy-Octo-Bootstrap-Theme)
      * View on [Behance](https://www.behance.net/gallery/27164131/The-Spicy-Octo-FREE-Responsive-Template)
      * Throw a ball on [Dribbble](https://dribbble.com/shots/2119718-The-Spicy-Octo-Bootstrap-Theme?list=users&offset=0)

      If you have any questions or comments contact me [vanessa.serka@refactorit.co](mailto:vanessa.serka@refactorit.co?Subject=Template%20question)
      ![responsive](http://www.refactorit.co/images/responsive-octo.jpg)
    BODY
    )
  )
  Post.create!(title: 'Using custom scope in Rails association',
    author: ivan, status: 1, slug: 'using-custom-scope-in-rails-association',
    published_at: DateTime.parse('2016-02-05 09:15:27'), topic: development,
    description: (<<~DESC
      I came across a situation that I needed a custom scope in an 5
      association, something that is unusual. It can help a lot, and here’s how.
    DESC
    ),
    body: (<<~BODY
      I came across a situation that I needed a custom scope in an 5
      association, something that is unusual. It can help a lot, and here’s how.

      ![Scoped associations](http://www.refactorit.co/images/scoped_associations.png)

      On a project that I’m working on, BidProduct model delegates photo_url
      to a Product model. The Product model uses [Paranoia](https://github.com/rubysherpas/paranoia)
      gem for soft delete.

      Simplified a bit, it look like this:

      ```ruby
      class BidProduct < ActiveRecord::Base
        belongs_to :product

        delegate :photo_url, to: :product
      end
      class Product < ActiveRecord::Base
        acts_as_paranoid
      end
      ```

      The problem occurs when someone deletes Product object. Calling photo_url
      method in BidProduct raises Module::DelegationError exception. Desired
      functionality is to keep BidProduct record and show it’s photo even when
      original Product is deleted.

      Luckily, Paranoia gem provides with_deleted scope which includes deleted
      records in the results. Less known feature in Rails associations is
      passing scope block to it. When scope block is passed in association, it
      is applied when the connected model is accessed.

      Combining these two we can write our BidProduct class like this:

      ```ruby
      class BidProduct < ActiveRecord::Base
        belongs_to :product, -> { with_deleted }

        delegate :photo_url, to: :product

      end
      ```

      Now photo_url on the BidProduct object is delegated to the Product object
      even when it’s soft deleted.

      Any other standard querying method can be used inside the scope block.
      You can check more about it in [Scopes for belongs_to](http://guides.rubyonrails.org/association_basics.html#scopes-for-belongs-to)
      section of Rails guides.
    BODY
    )
  )
  Post.create!(title: 'Rails application from ground zero', author: ivan,
    status: 1, slug: 'rails-app-from-ground-zero',
    published_at: DateTime.parse('2016-02-26 09:11:27'), topic: development,
    description: (<<~DESC
      This post is a follow-up to a talk I gave on the Ruby Zagreb meetup. The
      motivation for it was the desire to better understand how Rails works and
      to learn how to create an application from complete scratch. There aren’t
      many use cases for it but it’s worth doing for the sake of becoming a
      better Rails developer.
    DESC
    ),
    body: (<<~BODY
      This post is a follow-up to a talk I gave on the Ruby Zagreb meetup. The
      motivation for it was the desire to better understand how Rails works and
      to learn how to create an application from complete scratch. There aren’t
      many use cases for it but it’s worth doing for the sake of becoming a
      better Rails developer.

      ![Rails from zero](http://www.refactorit.co/images/rails_from_zero.png)

      Instead of generating ~40 files with rails new command we'll start with
      a single file and continue building upon it.


      #### Rack application

      Rails is a Rack-based web framework so let’s recall how Rack applications
      looks like. From the Rack documentation:

      _To use Rack, provide an "app": an object that responds to the call method,
      taking the environment hash as a parameter, and returning an Array with
      three elements:_

      * _The HTTP response code_
      * _A Hash of headers_
      * _The response body, which must respond to each_

      Here is an example of a simple Rack application:

      ```ruby
      # config.ru
      app = Proc.new {
        |env| [200, { 'Content-Type' => 'text/html' }, ['Hello World!']]
      }

      run app
      ```

      It is invoked with rackup config.ru. Let's check in ruby console what
      call() method returns:

      ```ruby
      irb> app.call('REQUEST_METHOD' => 'GET', 'PATH_INFO' => '/')

      => [200, {"Content-Type"=>"text/html"}, ["Hello World!"]]
      ```

      #### Minimalistic Rails application

      Cool! Now let’s create a simple Rails app. It should be similar to the pure
      Rack app but now app object is going to be Rails::Application instance instead
      of Proc.

      ```ruby
      # config.ru
      require 'rails'

      app = Class.new(Rails::Application){

      }.initialize!

      run app
      ```

      This isn’t enough because app object should respond to the call() method.
      Defining response to the root path is going to fulfil that condition.

      Every request goes through ActionDispatch and is routed to a controller so
      ActionController has to be included in the app.
      Requiring 'rails/all' instead of 'action_controller' will include other common
      libraries such as ActiveRecord, ActionView or ActionMailer but those aren't
      needed for now.

      ```ruby
      # config.ru
      require 'rails'
      require 'action_controller'

      app = Class.new(Rails::Application){
        routes.append{ root to:proc{
          [200, { 'Content-Type' => 'text/html' }, ['Hello World!']]
        }}
      }.initialize!

      run app
      ```

      It's almost working! :)
 
      One more thing is required to make it work and that is the secret token.
      It is a randomised string used to verify the integrity of signed cookies.
      It can be any string but in production you’ll probably want to use
      something more secure to generate it, such as SecureRandom.hex(64) or the
      Rails built-in rake secret task.

      ```ruby
      # config.ru
      require 'rails'
      require 'action_controller'

      app = Class.new(Rails::Application){
        config.secret_key_base='0837359d48a53883'
        routes.append{ root to:proc{
          [200, {'Content-Type'=>'text/html'}, ['Hello World!']]
        }}
      }.initialize!

      run app
      ```

      That’s it! Visiting http://localhost:9292 in a browser should return
      ‘Hello World!’ and here is the response to the call() method in ruby
      console.

      ```ruby
      irb> app.call('REQUEST_METHOD' => 'GET', 'PATH_INFO' => '/')

      => [200, {"Content-Type"=>"text/html", "ETag"=>"W/\"ed076287532e86365e841e92bfc50d8c\"", "Cache-Control"=>"max-age=0, private, must-revalidate"
      ```

      #### Configuration and initialization

      Now that we understand what’s required for a minimalistic Rails app we can
      expand it and create something that will look more like a usual application.
      Configuration should be separated into multiple files for better organization.

      From Rails 4.2 version there is a config/secrets.yml file aimed to store
      application’s secrets:

      ```ruby
      # config/secrets.yml
      development:
      secret_key_base: '0837359d48a53883'
      ```

      Routes should be extracted into config/routes.rb where all paths are defined:

      ```ruby
      # config/routes.rb
      Rails.application.routes.draw do
        root to:proc{ [200, { }, ['Hello World!']] }
      end
      ```

      Configuration for Rails::Application which will be used once the
      application is fully initialized is defined in config/application.rb:

      ```ruby
      # config/application.rb
      require 'rails'
      require 'action_controller'

      Class.new(Rails::Application){

      }
      ```

      The application is initialized in config/environment.rb:

      ```ruby
      # config/environment.rb
      require File.expand_path('../application', __FILE__)

      Rails.application.initialize!
      ```

      Config.ru is still used to start the application, but it is much simpler now.

      ```ruby
      # config.ru
      require File.expand_path('../config/environment', __FILE__)

      run Rails.application
      ```

      #### Bundler

      Using Bundler is a standard way of handling dependencies and it’s hard to
      imagine development without it. Environment variable BUNDLE_GEMFILE is set
      in config/boot.rb and it points to a Gemfile location. Same file is used
      to configure the load path so all dependencies in a Gemfile can be
      required:

      ```ruby
      # config/boot.rb
      ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

      require 'bundler/setup'
      ```

      ```ruby
      # config/application.rb
      require File.expand_path('../boot', __FILE__)

      require 'rails'
      require 'action_controller'

      Bundler.require(:default)

      Class.new(Rails::Application){

      }
      ```

      ```ruby
      # Gemfile
      source 'https://rubygems.org'

      gem 'rails', '~> 4.2.5'
      ```

      #### Command line - rails and rake commands

      Although it’s great fun to write an app from scratch there are some commands
      that are essential for Rails development. We want to enable rails commands so
      that we can benefit from using the console or running the server. Rails
      commands are included in the bin/rails app so we’ll add that file:
 
      ```ruby
      # bin/rails
      APP_PATH = File.expand_path('../../config/application', __FILE__)
      require_relative '../config/boot'
      require 'rails/commands'
      ```

      Another command line tool that is useful is Rake. Loading tasks happens in
      Rakefile:

      ```ruby
      # Rakefile
      require File.expand_path('../config/application', __FILE__)

      Rails.application.load_tasks
      ```

      #### Requiring rails/all

      To use all of the libraries that make Rails such a powerful framework rails/all
      should be included in config/application.rb. Also, instead of initializing an
      instance of an unnamed class (that is Class.new(Rails::Application)) we’ll
      create a proper class definition.

      ```ruby
      # config/application.rb
      require File.expand_path('../boot', __FILE__)

      require 'rails/all'

      Bundler.require(:default)

      module RailsFromZero
        class Application < Rails::Application
 
        end
      end
      ```
 
      Before we start creating controllers for our resources ApplicationController
      should be defined because other controllers subclass it.

      ```ruby
      # app/controllers/application_controller.rb
      class ApplicationController < ActionController::Base

      end
      ```

      We’ll probably want to enable the database in the application. In this example
      we’ll make do with SQLite which is the default Rails database. To set it up,
      sqlite3 gem should be added in the Gemfile and config/database.yml should have
      a database configuration for every application environment:
 
      ```ruby
      # Gemfile
      source 'https://rubygems.org'

      gem 'rails', '~> 4.2.5'
      gem 'sqlite3'
      ```

      ```ruby
      # config/database.yml
      default: &default
        adapter: sqlite3
        pool: 5
        timeout: 5000

      development:
        <<: *default
        database: db/development.sqlite3
      ```

      From this point it should be possible to use most of the features that come
      with Rails. To learn more about rails configuration you can read the
      [Configuring Rails Applications](http://guides.rubyonrails.org/configuring.html)
      guide and for better understand the initialization process there is
      [The Rails Initialization Process](http://guides.rubyonrails.org/initialization.html).
 
      Of course, the best way to understand it deeply is to check the source code of
      the Rails framework and the source of the newly generated application.
    BODY
    )
  )
  Post.create!(title: 'Bath Ruby 2016 Review', author: ivan,
    status: 1, slug: 'bath-ruby-2016-review',
    published_at: DateTime.parse('2016-03-16 16:24:27'), topic: community,
    description: (<<~DESC
      We’re just back from the Bath Ruby Conference and thought we should summarize our impressions now while they’re fresh. In case you’re not familiar with it, the one-day, single-track conference took place in Bath, England, on March 11, and around 500 Rubyists attended.
    DESC
    ),
    body: (<<~BODY
      We’re just back from the Bath Ruby Conference and thought we should
      summarize our impressions now while they’re fresh. In case you’re not
      familiar with it, the one-day, single-track conference took place in Bath,
      England, on March 11, and around 500 Rubyists attended.

      #### Bath Conference Venue

      If you don’t know Bath, the city is a beautiful spa destination well known
      for its Roman-built, hot-spring baths. In fact, in 1987 it was selected as
      a UNESCO World Heritage site in recognition of its international cultural
      importance. It’s definitely worth visiting if you’re looking for a short
      break from everyday life.

      Unfortunately, we didn’t visit the spa this
      time, but, hey, we had to leave something for the next year.

      ![Location](http://www.refactorit.co/images/bathruby_location.jpg)

      The conference venue at the National Trust’s Assembly Rooms made up for
      this, though. It is an elegant and fashionable meeting place and imparted
      a sense of nobility to the entire conference.

      #### Conference Agenda

      Bathy Ruby featured six talks of around 30 minutes each that provided a
      good mix of technical and non-technical information on a wide range of
      topics. The conference also included three lightning talk sessions made up
      of four or five short presentations each.

      While the lightning talks were fun and important, we’ll focus here on
      summarizing the ones on Bath Ruby’s main agenda.

      ![Talks](http://www.refactorit.co/images/bathruby_talks.jpg)

      #### The Main Presentations

      **Xavier Riley** - *Rocking out in Ruby: a playful introduction to Sonic Pi*

      Following our warm welcome by our hosts, Xavier gave a truly amazing talk
      about Sonic Pi. It’s a tool designed to teach programming concepts through
      the process of creating new sounds, and it’s available for Raspberry Pi,
      Mac OS X, and Windows.

      It was quite interesting to hear Xavier’s live coding on stage be
      transformed into multi-threaded music. This talk was definitely a great
      way to start the conference.

      **Coraline Ada Ehmke** - *How Neo4j Saved My Relationship*

      Coraline explained the basic concepts of graph databases using one of the
      most popular ones—Neo4j—as an example. It comes in three editions, has a
      cool admin panel, and offers plentiful use cases that demonstrate why it’s
      better choice than relational databases.

      Neo4j.rb is an Active Model compliant Ruby wrapper, which makes switching
      to Neo4j easy if you’re already used to Active Record.

      **Courteney Ervin** - *Open Source for Your Benefit*

      In this interactive talk, Courtney explained different ways and reasons
      for contributing to open source. In particular, she asked us to think of
      personal reasons for doing this, and, at the end, we all received
      permission to do so. She also let us know that, if we didn’t feel excited
      about contributing to open source, that’s also okay. :)

      **Janet Crawford** - *The Surprising Neuro-science of Gender Inequality*

      As the only female student in a real physics department, Janet experienced
      gender inequality in a professional surrounding early on. With regard to
      this topic, she explained how our brain tries to put terms and concepts
      into groups and why we consider some professions and activities more
      appropriate for females or males.

      Even if we consciously strive for gender equality, she pointed out,
      unconsciously our brain is struggling because it’s wired with stereotypes
      that have been stuck in our heads since early ages.

      **Zach Holman** - *Firing People*

      Zach talked about his personal experience of being fired from GitHub and
      what he went through afterwards. He gave good advice on how to behave in
      those situations whether you’re the one fired, the one doing the firing,
      or a coworker of the one fired.

      **Aaron Patterson** - *How are method calls formed?*

      Aaron’s humor broke the ice before his deep technical talk about how to
      form method calls. Although he focused on “nasty” things like caching
      method calls, he started his presentation by tackling broad ideas and
      issues that everyone could understand before getting into the
      nitty-gritty. It was a great, engaging way to discuss technical concepts
      for people of all skill levels.

      #### Between talks

      Probably the busiest places during breaks were the Job and Open Source
      boards. It seems everyone is looking for developers, and these boards were
      a cool way to reach out to them.

      ![Breaks](http://www.refactorit.co/images/bathruby_breaks.jpg)

      Another great thing about conferences like Bath Ruby is the socializing.
      We had many breaks for tea, coffee, and snacks where we could make
      contacts and talk to each other. Even after the closing words, the
      conference went on as everyone hung out and enjoyed food and drink at the
      informal after-party.

      #### Final words

      Everything at Bath Ruby seemed to go smoothly. The talks happened on time.
      Technical glitches were absent (except, maybe, for Aaron’s pinky
      presentation), and the organizers were incredibly helpful.

      A big thank you from us to all the organizers and sponsors who made this
      conference happen. We send special thanks to guys who helped us print our
      leaflet and then put it up on the board while we were on lunch break. :)

      Long story short, it was awesome! See you next year!
    BODY
    )
  )
  Post.create!(title: 'Random Active Record', author: neven,
    status: 1, slug: 'random-active-record',
    published_at: DateTime.parse('2016-04-19 01:00:00'), topic: development,
    description: (<<~DESC
      Getting random results from a database table using Active Record is a
      fairly common action that seems straightforward, but even though there
      are several ways to do it, they all have their drawbacks and subtleties.
      For this post I will use Rails 4.2.3 with PostgresSQL 9.3 for all the
      examples.
    DESC
    ),
    body: (<<~BODY
      Getting random results from a database table using Active Record is a
      fairly common action that seems straightforward, but even though there
      are several ways to do it, they all have their drawbacks and subtleties.
      For this post I will use Rails 4.2.3 with PostgresSQL 9.3 for all the
      examples.

      ![Dices](http://www.refactorit.co/images/dices.png)

      #### Sample solution

      Certainly the simplest way to get a random record from the database is
      this:

      ```sql
      User.all.sample
      ```

      And the generated SQL:

      ```sql
      SELECT "users".* FROM "users"
      ```

      If you know that you’ll only ever have a few records it will work well
      enough, and we can easily choose what number of random results we want by
      passing an integer to the sample method. e.g. sample(8) will return an
      array of 8 random records.

      However if you have stored a large number of records this solution will
      become very slow. All the objects will be loaded into memory before the
      random one is chosen which in case of millions of rows will amount in a
      pretty large amount of memory used, as can be seen in the benchmark where
      getting a record from a million rows takes a whopping 14 seconds on my
      machine, almost 2 orders of magnitude slower than the most efficient
      solution in this post.

      The next two solutions offload most of the work to the database:

      #### Offset solution

      ```ruby
      offset = rand(User.count)
      result = User.offset(offset).limit(1).first
      ```

      ```sql
      SELECT COUNT(*) FROM "users"
      SELECT  "users".* FROM "users" LIMIT 1 OFFSET 54
      ```

      The offset solution is a bit more complicated and it generates two
      queries. First we get a count of the rows in the table and pick a random
      number based on the count, and then we pick a random record by offseting
      that number. We can’t just use find(offset), because there could be
      missing rows in the table due to deletion which would cause errors and
      highest IDs would never be fetched since count would always be lower than
      the largest ID number.

      You can still get multiple results by modifying the query a bit and
      calling .limit(n) instead. In that case we get an ActiveRecord_Relation
      as a result so we can perform all the actions associated with that class
      on the results.

      Performance wise we call two queries and count will have to scan through
      the whole table sequentially, and the Postgres docs say that large
      offsets might be inefficient but this solution is still much much quicker
      than the previous one.

      Random function solution

      ```ruby
      User.order("random()").first
      ```

      ```sql
      SELECT  "users".* FROM "user"  ORDER BY Random() LIMIT 1
      ```

      Now we only have one line of code and one query generated but it’s not
      database agnostic, MySQL has a similar function rand() and other databases
      probably have their own functions for random ordering. Using the random
      order on the database level is slower on a million records than the offset
      solution (around 2.5 times), but on a smaller table the performance is
      about the same.

      The positive side of this approach is that we can keep earlier ordering
      when fetching the record. Let’s say you have premium and regular users,
      and you want to sort them so that the premium users come first in the
      order. In this case you can still get a random premium user, while if
      there are no premium users the query will still return a random regular
      user. In other solutions you would have to repeat the process for regular
      users if you find no premium users so the random function saves you from
      doing more queries on the database.

      #### Conclusion

      The offset solution is probably suitable for most use cases as it is the
      most performant one, but as explained there are cases when other solutions
      can be handy too. There are certainly more performant ways to get a random
      result from the database, but it involves writing custom SQL queries or
      using performant databases like Redis, but that is outside the scope of
      this post.

      #### Completely non scientific benchmark

      Thousand records

      ```bash
      user     system      total        real
      sample   0.010000   0.000000   0.010000 (  0.015339)
      offset   0.000000   0.000000   0.000000 (  0.001908)
      order    0.000000   0.000000   0.000000 (  0.001666)
      ```

      Million records

      ```bash
      user     system      total        real
      sample  12.230000   1.690000  13.920000 ( 17.872464)
      offset   0.010000   0.000000   0.010000 (  0.272729)
      order    0.000000   0.000000   0.000000 (  0.693145)
      ```
    BODY
    )
  )
end
