require 'bundler/setup'
require 'RMagick'
include Magick

class RippedImage

  def initialize(m, n, path_to_images)
   @m = m
   @n = n
   @path_to_images = path_to_images
  end

  # m = 3
  # n = 4
  #@path_to_images = "#{File.dirname(__FILE__)}/images"


  images = []
  Dir.glob("#{@path_to_images}/*").each do |image|
    images << Magick::Image.read(image).first
  end

  number_of_images = images.size
  first_image = images.first

  #Rmagick tricks:
  width  = first_image.columns
  height = first_image.rows

  #parameters of a fragment:
  fragment_width  = (width / @m).to_i
  fragment_height = (height / @n).to_i


  final_image = Magick::Image.new(width,height)

  i = 0
  0.upto(@n-1) do |y|
    0.upto(@m-1) do |x|
      i += 1
      if number_of_images < i
        image = images[((i % number_of_images)-1)]
      else
        image = images[i-1]
      end

      fragment = image.get_pixels(x*fragment_width, y*fragment_height, fragment_width, fragment_height)
      final_image.store_pixels(x*fragment_width, y*fragment_height, fragment_width, fragment_height, fragment)
    end
  end

  final_image.write("#{File.dirname(__FILE__)}/final_image/final_image.jpg")

end