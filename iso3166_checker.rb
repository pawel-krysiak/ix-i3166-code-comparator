require 'pdf-reader'
require_relative 'current_country_codes'

class CodesComparator

	def initialize(filename)
    @reader = PDF::Reader.new(filename)
    @retreived_codes = retreive_country_codes
    @country_codes = CurrentCountryCodes.country_codes
  rescue ArgumentError
    puts "Error: There is no file under specified path.."
	end

	def retreive_country_codes
		codes = {}
		@reader.pages.each do |page|
			page.text.split(/\n\n?/).drop(3).each do |line|
				code = line.strip.split(/\s\s\s+/)[1]
				country = line.strip.split(/\s\s\s+/)[-1].capitalize
				if code.length <= 2 #ignore malformed entires
					codes[country] = code
				end
			end
		end
		codes
	end

	def compare_codes
		@retreived_codes.each do |k, v|
			unless @country_codes.values.include?(v)
				puts "=> You are missing: #{k} - #{v}"
			end
		end
	end
end

CodesComparator.new(ARGV[0]).compare_codes


