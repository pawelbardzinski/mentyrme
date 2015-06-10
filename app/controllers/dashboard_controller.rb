class DashboardController < ApplicationController

	before_action :authenticate_user!
	
	def index
    @categories = Category.all
	end
  
  def find_mentor
     @categories = Category.all
  end
end
