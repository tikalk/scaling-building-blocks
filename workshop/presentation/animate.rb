#! /usr/bin/env ruby
# Usage: ruby amimate.rb /path/to/input_file
# Output: /path/to/2input_file

$milliseconds = 500
$milliseconds_adder = 300
$step = 0

begin 
	def process(line)
		if line =~ /~s/
			$milliseconds = 500
		end

		if line =~ /~m/
			$milliseconds += $milliseconds_adder
		end

		if line =~ /~s/
			$step += 1
			line = line.sub('~s', 'class="step" data-x="' << ($step*1000).to_s << '" data-y="0"')
		end

		if line =~ /~m/
			line = line.sub('~m', 'data-jmpress="zoom after ' << $milliseconds.to_s << 'ms step"')
		end

		line
	end

	# Open files 
	f1 = File.open(ARGV[0], 'r')
	f2 = File.open(File.dirname(ARGV[0])  + '/out-' + File.basename(ARGV[0]), 'w') 

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
