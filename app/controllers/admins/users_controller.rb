class Admins::UsersController < ApplicationController

  def index
    @users = Public.page(params[:page]).per(10)
  end

  def edit
    @user = Public.find(params[:id])
  end

    def update
      @user = Public.find(params[:id])
  if
      @user.update(user_params)
      redirect_to admins_users_path(@user.id), flash:{success: "You have updated user successfully."}
   else
      render  action: :edit
   end
  end

  def destroy
    @user = Public.find(params[:id])
    if @user.destroy
      flash[:notice] = "退会させました。"
      redirect_to root_path
    else
      render :out
    end
  end

  def out
  end

  def user_find
    @user = User.find(params[:id])
  end

private

    def user_params
    params.require(:public).permit(:email, :nickname, :profile_image)
  end

end