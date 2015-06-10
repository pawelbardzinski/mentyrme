class PhotosController < ApplicationController

	before_action :authenticate_user!

	def index
		@skill = Skill.includes(:photos).find(params[:skill_id])
		@photos = @skill.photos
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(add_params)

		skill = Skill.find(params[:skill_id])
		skill.photos << @photo

    respond_to do |format|
      if skill.save
        format.html { redirect_to profile_skill_photos_path(params[:skill_id]) }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { redirect_to profile_skill_photos_path(params[:skill_id]) }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
	end


	protected

	def add_params
    params.require(:photo).permit(:image_file)
  end
end
