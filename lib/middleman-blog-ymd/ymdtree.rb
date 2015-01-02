class Ymdtree
	@hash = Hash.new{|h, k| h[k] = Hash.new(&h.default_proc)	}

	class << self
		def init(blog_data)
			blog_data.articles.each{|article|
					year_value = article.date.gmtime.year
					month_value =article.date.gmtime.month
					day_value =article.date.gmtime.day
					add(year_value, month_value, day_value)
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

		def previous_year(y)
			ys = years
			sorted_ys = ys.sort
			yidx = sorted_ys.index(y)
			case yidx
			when 0
				return nil
			when nil
				raise Error , "argument year doesn't exist"
			else
				return sorted_ys[yidx - 1]
			end
		end

		def next_year(y)
			ys = years
			sorted_ys = ys.sort
			yidx = sorted_ys.index(y)
			case yidx
			when (sorted_ys.length - 1)
				return nil
			when nil
				raise Error , "argument year doesn't exist"
			else
				return sorted_ys[yidx + 1]
			end
		end

		def last_month_of_year(y)
			ms = @hash[y].keys
			sorted_ms = ms.sort
			sorted_ms.last
		end

		def first_month_of_year(y)
			ms = @hash[y].keys
			sorted_ms = ms.sort
			sorted_ms.first
		end

		def previous_month( y , m)
			month_array = @hash[y].to_a
			month_array = month_array.collect{|month|
				month[0]
			}
			m_idx = month_array.index(m)
			if m_idx == ( month_array.length - 1 )
				if previous_year(y)
					return [ previous_year(y), last_month_of_year( previous_year(y) )] 
					# preious year of last month
				else
					return nil
				end
			else
				return [ y, month_array[ m_idx + 1 ] ]
			end
		end

		def next_month( y , m)
			month_array = @hash[y].to_a
			month_array = month_array.collect{|month|
				month[0]
			}
			m_idx = month_array.index(m)
			if m_idx == 0
				if next_year(y)
					return [ next_year(y), first_month_of_year( next_year(y) ) ] 
					# preious year of last month
				else
					return nil
				end
			else 
				return [y , month_array[ m_idx - 1 ] ]
			end
		end
	end
end
