class ProfilesController < ApplicationController

	before_action :authenticate_user!
	before_action :get_profile

  layout "no_container", only: [:show]

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
		@photos = @profile.get_skill.photos if @profile.get_skill
		@mentor = @profile.user
    @number_of_sessions = @mentor.teaching_bookings.size
    if session[:is_booking_in_progress] == 1
      @booking = Booking.new
    end
    
	end

  

	def photos
		@skill = @profile.get_skill
		@photos = @skill.photos
		@photo = Photo.new
	end


	protected

	def get_profile
    if params[:id] 
      @profile = Profile.joins(:user).find(params[:id])
    else
      @profile = Profile.joins(:user).find(current_user.profile.id)
    end
    authorize @profile
	end

	def update_params
    params.require(:profile).permit( :one_line_description, :about_me, :expertise_description, :sales_pitch, :employer, :school, :languages, avatar_attributes: [:id, :image_file], skills_attributes:  [:id, rate_attributes: [:id, :amount, :type]])
  end

end