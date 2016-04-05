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
    author: filip, status: 1, slug: 'using-custom-scope-in-rails-association',
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
end
