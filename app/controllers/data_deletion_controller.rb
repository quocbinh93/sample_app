class DataDeletionController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :facebook_deletion
  before_action :verify_facebook_deletion_request, only: :facebook_deletion

  def facebook_deletion
    user_id = params[:id]
    
    if request.get?
      # Nếu là GET request, trả về trang thông tin
      render html: confirmation_page
    else
      # Nếu là DELETE request, xử lý xóa dữ liệu
      if delete_user_data(user_id)
        render json: { confirmation_code: SecureRandom.hex(8) }, status: :ok
      else
        render json: { error: "Cannot process deletion request" }, status: :unprocessable_entity
      end
    end
  end

  private

  def delete_user_data(user_id)
    # Logic xóa dữ liệu người dùng ở đây
    # Ví dụ:
    user = User.find_by(uid: user_id, provider: 'facebook')
    return false unless user

    # Xóa dữ liệu liên quan đến người dùng
    # user.posts.destroy_all
    # user.comments.destroy_all
    # user.likes.destroy_all
    
    # Hoặc anonymize dữ liệu
    # user.update(name: 'Anonymous', email: "anonymous_#{SecureRandom.hex(4)}@example.com")
    
    # Hoặc xóa hoàn toàn người dùng
    # user.destroy

    true # Trả về true nếu xóa thành công
  end

  def verify_facebook_deletion_request
    # Tùy chọn: xác minh yêu cầu đến từ Facebook
    # Kiểm tra signed_request từ Facebook
    true # Bỏ qua xác minh trong ví dụ này
  end

  def confirmation_page
    <<-HTML
      <!DOCTYPE html>
      <html>
        <head>
          <title>Xóa dữ liệu Facebook</title>
          <style>
            body { font-family: Arial, sans-serif; margin: 40px; line-height: 1.6; }
            h1 { color: #333; }
            .container { max-width: 800px; margin: 0 auto; }
          </style>
        </head>
        <body>
          <div class="container">
            <h1>Xóa dữ liệu người dùng Facebook</h1>
            <p>Chúng tôi tôn trọng quyền riêng tư của bạn. Trang này cho phép người dùng Facebook yêu cầu xóa dữ liệu của họ từ hệ thống của chúng tôi.</p>
            <p>Để yêu cầu xóa dữ liệu:</p>
            <ol>
              <li>Vào trang cài đặt Facebook của bạn</li>
              <li>Đi đến mục Ứng dụng và Trang web</li>
              <li>Tìm ứng dụng của chúng tôi và chọn "Xóa dữ liệu"</li>
            </ol>
            <p>Sau khi nhận được yêu cầu của bạn, chúng tôi sẽ xóa mọi dữ liệu cá nhân liên quan đến tài khoản Facebook của bạn.</p>
            <p>Nếu bạn có thắc mắc, vui lòng liên hệ: <a href="mailto:support@example.com">support@example.com</a></p>
          </div>
        </body>
      </html>
    HTML
  end
end
