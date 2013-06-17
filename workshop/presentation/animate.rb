#! /usr/bin/env ruby
# Usage: ruby amimate.rb /path/to/input_file
# Output: /path/to/2input_file

$milliseconds = 500
$milliseconds_adder = 300
$step = 0
$substep = 0
$cols_per_row = 5

begin 
	def process(line)
		if line =~ /~s/
			$milliseconds = 500
		end

		if line =~ /~m/
			$milliseconds += $milliseconds_adder
		end

		if line =~ /~n/
			line = line.sub('~n', '<span style ="position:absolute; left:20px; bottom:0;"> =' << $step.to_s << '= </span>')
		end

		if line =~ /~s/
			$step += 1
			$substep = 0
			# i'm pretending that I know what I'm doing with these data-x/y etc. But it gives nice result! :)
			line = line.sub('~s', 'class="step step' << ($step.to_s) <<'" data-x="' << (($step % $cols_per_row) *1000).to_s << '" data-y="'+(($step / $cols_per_row) *700).to_s+'"' << ' data-scale="0.'+ (($step%2==0)? '2' : '4') +'" data-rotate-'+ (($step%2==0)? 'x' : 'y') +'="30"')
		end

		if line =~ /~m/
			line = line.sub('~m', 'id="step-' << ($substep.to_s) << '" ~m')

			if $substep != 0
				line = line.sub('~m', 'data-jmpress="zoom after step-' << (($substep -1).to_s) << '"')
			else 
				line = line.sub('~m', 'data-jmpress="zoom after step"')
			end
			$substep += 1
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
