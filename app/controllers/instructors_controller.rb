class InstructorsController < ApplicationController

  def show
    @instructor = Instructor.find_by_id(@current_user)
    @collections = @instructor.collections
  end

  def mark_as_current
    Instructor.update(@current_user.id, {:current_collection => params[:id]})
    redirect_to profile_path
  end

  def show_unauthorized
  	@unauthorized_users = Instructor.nonadmin
  	render 'admin'
  end

  def authorize
  	user = Instructor.find(params[:id])
  	if params[:action] == "authorize"
  		user.update_attributes(privilege: "admin")
  	else
  		user.update_attributes(privilege: "denied")
  	end
  	redirect_to admin_path
  end

end