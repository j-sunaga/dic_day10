class UsersController < ApplicationController

  before_action :user_find, only: [:show,:edit,:update]

  def new
     @user = User.new
  end

  def create
    @user= User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: "会員登録が完了しました。"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  #アップデートアクション
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "会員情報を変更しました。"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def user_find
    @user= User.find(params[:id])
  end

end
