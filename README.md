# Middleman-Blog-YMD Extension 

This is an extension for Middleman blog.

## Introduction & Motivation

This extension provides helper methods of middleman-blog. These methods enables you to collect years and months data of your blog articles. These years and months data mean only years and months WHICH HAVE ARTICLES. 

The motivation of this gem came from my own blog based on middleman-blog. I couldn't easily get months having articles of specific year. I couldn't get next month which have article. 


## Installation

Add this line to your application's Gemfile:

    gem 'middleman-blog-ymd'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-blog-ymd


## Configuration

In config.rb file, add the next line. This line should come after "activate :blog"

    activate :ymd_extension


## Usage

All the helper methods' names  begin with "ymd". This avoids method name confliction. In view of Middleman-blog, "blog" helper  mothod returns BlogData. YMD methods get years and methods data from this BlogData object.


* ymd_years_of(blog)
  + returns years having articles in Array.

* ymd_year_months_hash_of(blog)
  + returns pairs of year and month"S" having articles in Hash. 
  + The returned hash is like this,  

~~~ Ruby
{ 2013 => [1,2,3,4,5,6,7,8,9], 2014 => [1,2,3,4,5,6,7,8,9] } )
~~~

* ymd_next_month_of(blog, current_year, current_month)
* ymd_prev_month_of(blog, current_year, current_month)
  + These methods return next month or previous month WHICH HAVE ARTICLES. Current year and month should be specified in argument by integer.

~~~ Ruby
# Example
ymd_next_month_of(blog, 2014, 1 ) # returns next month having articles of 2014 Jan.
~~~

This returns a pair of year and month number in Array (e.g. [ 2014, 1 ] [2015, 2] ). If you want to access its year its index is 0, the month, its index 1.

~~~ HAML
# HAML View Example
- previous_month = ymd_prev_month_of(blog, article_date.year, article_date.month)
- if previous_month
  = link_to( "Prev Month", "/#{previous_month[0]}/#{sprintf("%02d", previous_month[1])}.html" )

~~~

If you want to get a two digit value, use ruby method 
~~~~ Ruby
"%02d".%( integer )  # or use sprintf method
~~~~

which converts integer into two digits.

If you want to get short name of the month from the number
~~~~ Ruby
Date::MONTHNAMES[ integer ]
~~~~

## ToDo

In version 0.5, every time the ymd methods is called, Ymdtree is regenerated. This makes the build process slow. But good for Live Preview. I'd like to change this behavior based on "during build" or "live preview". My idea now is to make an option in this gem and change the option value in Rspec.

