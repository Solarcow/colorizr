class String
	@colors = {"red" => "31","green" => "32", "yellow" => "33", "blue" => "1;34", "pink" => "35",
		"light_blue" => "34", "white" => "37", "light_grey" => "1;37", "black" => "30"}
  
  def colorizr(color_code)
  	"\e[#{color_code}m#{self}\e[0m"

  end

  def self.color_creator
  	colors.each do |name, number|
		self.send(:define_method, "#{name}") do
			colorizr("#{number}")
		end
	end
  end

  def self.sample_colors
    #code to generate all color methods goes here
    colors.each do |name, number|
    	puts "This is #{name}".colorizr("#{number}")
    end
  end

  def self.colors
  	color_list = []
  	@colors.each do |name, number|
  		color_list << [name]
  	end
  end
end

String.color_creator

# \e[  \e[0m

# red, 31
# green, 32
# yellow, 33
# blue, 1;34
# pink, 35
# light_blue, 34
# white, 37
# light_grey, 1;37
# black, 30