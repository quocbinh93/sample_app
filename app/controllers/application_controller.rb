class ApplicationController < ActionController::Base
  include SessionsHelper  # Đảm bảo include SessionsHelper
  
  private
    # Xác nhận user đã đăng nhập
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end