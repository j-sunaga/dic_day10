class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to  user_path(user.id),notice:'ログインしました'
    else
      flash[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'ログアウトしました'
    render 'new'
  end

end
