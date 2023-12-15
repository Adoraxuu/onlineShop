# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    # 檢查帳密
    # 發號碼牌
    # 雜湊 Hashed
    user = User.login(params[:user])
    # redirec_to root
    # pw = Digest::SHA256.hexdigest("*xx#params[:user][:password]yy-")
    # user = User.find_by(email: '....', password: '....')

    if user
      # 發號碼牌
      session[:__user_ticket__] = user.id
      # 走到這一步就會有cookie
      redirect_to sign_in_users_path, notice: '登入成功'
    else
      redirect_to sign_in_users_path, alert: '登入失敗'
    end
  end

  def destroy
    session.delete(:__user_ticket__)
    redirect_to root_path, notice: '已登出'
  end
end
