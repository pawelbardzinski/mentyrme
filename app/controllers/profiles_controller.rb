class ProfilesController < ApplicationController

	before_action :authenticate_user!
	before_action :get_profile

	def edit
		if @profile.avatar.nil?
			@profile.avatar = Photo.new
		end
	end


	def update

		respond_to do |format|
			# if successfully saved
      if @profile.update(update_params)

				# if updating during registration set path go to next step
				if params.has_key?(:during_registration) && params[:during_registration]
					path = sign_up_select_availability_path
				# otherwise send back to the edit profile page
				else
					path = edit_profile_path
				end
				
        format.html { redirect_to path, notice: 'Your Profile Information Has Been Saved Successfully!' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
		
	end


	def show

	end


	protected

	def get_profile
		@profile = Profile.find(current_user.profile.id)
	end

	def update_params
    params.require(:profile).permit( :one_line_description, :expertise_description, :sales_pitch, :employer, :school, :languages, avatar_attributes: [:id, :image_file], skills_attributes:  [:id, rate_attributes: [:id, :amount, :type]])
  end

end