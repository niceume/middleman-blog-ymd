class Ymdtree
	@hash = Hash.new{|h, k| h[k] = Hash.new(&h.default_proc)	}

	class << self
		def init(blog_data)
			blog_data.articles.each{|article|
				if article.path =~ /^(\d+)\/(\d+)\/(\d+)_/
					year_value = $1.to_i
					month_value = $2.to_i
					day_value = $3.to_s[6..7].to_i
					add(year_value, month_value, day_value)
				end
			}
		end
		def hash
			return @hash
		end
		def add(y , m , d)
			@hash[y][m][d] = true
		end
		def years
			@hash.keys
		end
		def months_of( y )
			@hash[y].keys
		end
		def days_of( y, m )
			@hash[y][m].keys
		end
		def previous_month( y , m)
			month_array = @hash[y].to_a
			month_array = month_array.collect{|month|
				month[0]
			}
			m_idx = month_array.index(m)
			if m_idx == ( month_array.length - 1 )
				return false
			else
				return month_array[ m_idx + 1 ]
			end
		end
		def next_month( y , m)
			month_array = @hash[y].to_a
			month_array = month_array.collect{|month|
				month[0]
			}
			m_idx = month_array.index(m)
			if m_idx == 0
				return false
			else 
				return month_array[ m_idx - 1 ]
			end
		end
	end
end
