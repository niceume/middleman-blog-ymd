require "middleman-blog"
require File.expand_path("../middleman-blog-ymd/version", __FILE__)
require File.expand_path("../middleman-blog-ymd/ymdtree", __FILE__)

class YmdExtension < ::Middleman::Extension
  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super
  end

  helpers do
		def ymdtree_of(blog)
			Ymdtree.init(blog)
			return Ymdtree
		end

    def ymd_years_of(blog)
			Ymdtree.init(blog)
			return Ymdtree.years
    end

		def ymd_year_months_hash_of(blog)
			Ymdtree.init(blog)
			ymhash = Hash.new
			Ymdtree.hash.each{ |k, v|
				ymhash[k] = v.keys
		  }
			return ymhash
		end

		def ymd_next_month_of( blog, year, month)
			Ymdtree.init(blog)
			return Ymdtree.next_month(year, month)
		end

		def ymd_prev_month_of( blog, year, month)
			Ymdtree.init(blog)
			return Ymdtree.previous_month(year, month)
		end

  end
end

::Middleman::Extensions.register(:ymd_extension, YmdExtension)




