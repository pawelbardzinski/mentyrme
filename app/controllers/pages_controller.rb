class PagesController < ApplicationController

	def main
    @categories = Category.all
	end
  
  
end
