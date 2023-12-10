class ApplicationController < ActionController::Base
helper_method :current_user, :user_signed_in?, :current_cart?

  rescue_from ActiveRecord::RecordNotFound,
  with: :not_fund
  # 只要在controller出現這個錯誤，我就用not_fund方法

private

def current_cart
  if user_signed_in?
    #memorization
    @__cart__ ||= current_user.cart || current_user.create_cart
    #調不到車就做一個給你
  else
    Cart.new #什麼都沒有就給一台新車
  end
end

def current_user
  #memorization
  @__user__ ||= User.find_by(id: session[:__user_ticket__])
  # User.find_by(id: session[:__user_ticket__])
end

def user_signed_in?
  current_user.present?
end

def authenticate_user!
  #如果沒有登入就把你踢走
  if not user_signed_in?
    respond_to do |format|
      format.html {
        redirect_to sign_in_users_path, alert: '請先登入帳號'
      }

      format.json {
        render json: {
          message: '請先登入帳號',
          url: sign_in_users_path
        }, status: 401
      }
    end
  end
end


def not_fund
  render file: Rails.public_path.join('404.html'),
  status: 404,
  layout: false
end

end
