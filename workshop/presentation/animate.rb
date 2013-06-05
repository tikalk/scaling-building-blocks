#! /usr/bin/env ruby
# Usage: ruby amimate.rb /path/to/input_file
# Output: /path/to/2input_file

$milliseconds = 500
$milliseconds_adder = 300

begin 
	def process(line)
		if line =~ /class="step"/
			$milliseconds = 800
		end

		if line =~ /~/
			$milliseconds += $milliseconds_adder
		end

		unless line =~ /data-jmpress=/
			line.sub('~', 'data-jmpress="zoom after ' << $milliseconds.to_s << 'ms step"')
		else
			line
		end
	end

	# Open files 
	f1 = File.open(ARGV[0], 'r')
	f2 = File.open(File.dirname(ARGV[0])  + '/2' + File.basename(ARGV[0]), 'w') 

	# read and write
	while line = f1.gets  
		f2.puts process(line)
	end  
rescue
	raise 
ensure
	f1.close
	f2.close
end
