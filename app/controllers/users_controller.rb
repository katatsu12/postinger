class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    sign_in @user, :bypass => true 
    #if @user.save
    #  flash[:success] = "User was successufly created"
    #  redirect_to(:back)
    #else
    #  render 'new'
    #end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to (:back)
    end
  end

  private

  def become
    return unless current_user?
    sign_in(:user, User.find(params[:id]), { :bypass => true })
    #redirect_to root_url
  end
end
