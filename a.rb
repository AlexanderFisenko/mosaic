require 'bundler/setup'
require 'RMagick'

M = 3
N = 4

path_to_images = "#{File.dirname(__FILE__)}/images"

#first image in the folder:
images      = Dir.glob("#{path_to_images}/*")
first_image = Dir.glob("#{path_to_images}/*").first

#Rmagick tricks:
image  = Magick::Image.read(first_image).first
width  = image.columns
height = image.rows

part =

#create mosaic of images:

final_image = Image.new(width,height)

images.each do |original_image|
  original_image.g
end


