class Publics::UsersController < ApplicationController
  before_action :authenticate_public!
  before_action :user_find, only: [:edit, :update, :destroy, :out]
  before_action :current_public, only: [:show, :edit, :update , :destroy]

  def show
    @user = Public.find(params[:id])
    @user = current_public
  end

  def edit
    @user = Public.find(params[:id])
  end

  def update
    if
      @user = Public.find(params[:id])
      @user.update(user_params)
      redirect_to publics_user_path(@user.id), flash:{success: "You have updated user successfully."}
    else
      render action: :edit
    end
  end

  def destroy
    @user = Public.find(params[:id])
    if @user.destroy
      flash[:notice] = "退会しました。"
      redirect_to root_path
    else
      render :out
    end
  end

  def out
    @user = Public.find(params[:id])
  end

private



  def user_params
    params.require(:public).permit(:email, :nickname, :profile_image)
  end

  def user_find
    @user = Public.find(params[:id])
  end

  def correct_user
    user = Public.find(params[:id])
    unless user == current_public
      redirect_to publics_user_path(user)
    end
  end

end