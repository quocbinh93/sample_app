class SessionsController < ApplicationController

    skip_before_action :verify_authenticity_token, only: :create

    def new
      
    end
    def create
      if auth = request.env["omniauth.auth"]
        # Đăng nhập bằng GitHub
        user = User.find_by(email: auth.info.email) || User.create_from_github(auth)
        log_in user
        flash[:success] = "Welcome #{user.name}!"
        redirect_to user
      else
        # Đăng nhập thông thường
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          log_in user
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          redirect_back_or user
        else
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new', status: :unprocessable_entity
        end
      end
    end

    def destroy
      log_out if logged_in?
      redirect_to root_url
    end

    private

    def process_authenticated_user(user)
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = 'Account not activated. '
        message += 'Check your email for the activation link.'
        flash[:warning] = message
        redirect_to root_url
      end
    end
end


# class SessionsController < ApplicationController

#   def new
#   end

#   def create
#     user = User.find_by(email: params[:session][:email].downcase)
#     if user && user.authenticate(params[:session][:password])
#       if user.activated?
#         forwarding_url = session[:forwarding_url]
#         reset_session
#         params[:session][:remember_me] == '1' ? remember(user) : forget(user)
#         log_in user
#         redirect_to forwarding_url || user
#       else
#         message  = "Account not activated. "
#         message += "Check your email for the activation link."
#         flash[:warning] = message
#         redirect_to root_url
#       end
#     else
#       flash.now[:danger] = 'Invalid email/password combination'
#       render 'new'
#     end
#   end

#   def destroy
#     log_out if logged_in?
#     redirect_to root_url
#   end
# end
