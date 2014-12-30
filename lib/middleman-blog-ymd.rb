require "middleman-blog"
require File.expand_path("../middleman-blog-ymd/version", __FILE__)
require File.expand_path("../middleman-blog-ymd/ymdtree", __FILE__)

class YmdExtension < ::Middleman::Extension
  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super
  end

  helpers do
#		def ymdtree
#			Ymdtree.init(blog)
#			return Ymdtree
#		end

    def blog_years
			Ymdtree.init(blog)
			return Ymdtree.years
    end

		def blog_year_month_hash
			Ymdtree.init(blog)
			ymhash = Hash.new
			Ymdtree.hash.each{ |k, v|
				ymhash[k] = v.keys
		  }
			return ymhash
		end
  end
end

::Middleman::Extensions.register(:ymd_extension, YmdExtension)




