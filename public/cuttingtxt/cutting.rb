s = File.read("cruisingMovieText.txt", :encoding => Encoding::UTF_8)
dateList = Array.new
dateList.push(s)
lines = s.each_line {|line| p line.chomp }
puts lines[0][1]
