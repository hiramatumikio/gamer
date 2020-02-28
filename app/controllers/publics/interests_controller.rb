class Publics::InterestsController < ApplicationController
     before_action :authenticate_public!

    def index
      @interests = Interest.page(params[:page]).per(10)
      @user = current_public
    end

    def create
      @interest = current_public.interests.create(article_id: params[:article_id])
        if  @interest.save
          redirect_to publics_interests_path
        else
          redirect_to root_path
        end
    end

    def destroy
      @interest = Interest.find(params[:id])
      if @interest.destroy
      flash[:notice] = "気になるCDを削除しました。"
      redirect_to publics_interests_path
      else
      render :index
      end
    end

    private

  def interest_params
    params.require(:interest).permit(:id, :article_id, :public_id)
  end

    end





