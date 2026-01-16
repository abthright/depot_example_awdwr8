# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
# ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#   MovieGenre.find_or_create_by!(name: genre_name)
# end
#

Product.delete_all
# . . .

product_list = [
  {
    title: "Rails Scales!",
    description: 
      %(<p>
        <em>practical techniques for performance and growth<em>
        rails doesn't scale. so say the naysayers. they're wrong. ruby on rails
        runs some of the biggest sites in the world, impacting the lives of 
        millions of users while efficiently crunching petabytes of data. this
        book reveals how they do it, and how you can apply the same techniques
        application function at scale: monitoring, product design, ruby code,
        software architecture, database access, caching, and more. even if your
        app may never have millions of users, you reduce the costs of hosting
        and maintaining it.
      </p>),
    price: 30.95,
    img_filename: "cprpo.jpg" 
  },
  {
    title: "Programming Ruby 4 (6th edition)",
    description: 
      %(<p>
        <em>The pragmatic programmer's guide<em>
        Learn Ruby from the sixth edition of the book that first introduced Matz’s
        amazing language to the world, and that has taught hundreds of thousands of
        developers since. Updated to include all the new Ruby 4 features, this is
        the book to get to learn Ruby, and to stay up-to-date as Ruby evolves.
      </p>),
    price: 30.95,
    img_filename: "ruby5.jpg" 
  },
  {
    title: "Modern Front-End Development for Rails, Second Edition",
    description: 
      %(<p>
        <em>The pragmatic programmer's guide<em>
        Improve the user experience for your Rails app with rich,
        engaging client-side interactions. Learn to use the Rails 7 
        tools and simplify the complex JavaScript ecosystem. It’s
        easier than ever to build user interactions with Hotwire,
        Turbo, and Stimulus. You can add great front-end flair without 
        much extra complication. Use React to build a more complex 
        set of client-side features. Structure your code for different 
        levels of client-side needs with these powerful options.
        Add to your toolkit today!
      </p>),
    price: 30.95,
    img_filename: "nrclient2.jpg" 
  },
  {
    title: "Modern Front-End Development for Rails, Second Edition",
    description: 
      %(<p>
        <em>The pragmatic programmer's guide<em>
        Improve the user experience for your Rails app with rich,
        engaging client-side interactions. Learn to use the Rails 7 
        tools and simplify the complex JavaScript ecosystem. It’s
        easier than ever to build user interactions with Hotwire,
        Turbo, and Stimulus. You can add great front-end flair without 
        much extra complication. Use React to build a more complex 
        set of client-side features. Structure your code for different 
        levels of client-side needs with these powerful options.
        Add to your toolkit today!
      </p>),
    price: 30.95,
    img_filename: "nrclient2.jpg" 
  }
]

product_list.each do |item|
  product = Product.create(title: item[:title], description: item[:description], price: item[:price])
  product.image.attach(io: File.open(
    Rails.root.join("db", "images", item[:img_filename])),
    filename: item[:img_filename])
  product.save!
end


