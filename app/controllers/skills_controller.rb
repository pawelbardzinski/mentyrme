class SkillsController < ApplicationController

	before_action :authenticate_user!

	def edit 
		@skill = Skill.includes(:tags).find(params[:id])
		@categories = Category.includes(:tags).order(:name)
		@current_tag_ids = @skill.tags.pluck(:id)
	end


	def update
		skill = Skill.find(params[:id])
		
		if skill.update_attributes(update_skill_category_params) 

			# if updating during registration set path go to next step
			if params.has_key?(:during_registration) && params[:during_registration]
				path = sign_up_about_you_path
			# otherwise send back to the edit profile page
			else
				path = edit_profile_path
			end
			redirect_to path
		else
			format.html { render :back }
      format.json { render json: skill.errors, status: :unprocessable_entity }
		end
	end

	def update_skill_category_params
    params.require(:skill).permit(:id, :category_id, tag_ids: [])
  end
end
