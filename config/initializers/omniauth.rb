OmniAuth.config.allowed_request_methods = [:post, :get]
OmniAuth.config.silence_get_warning = true

GITHUB_CLIENT_ID= 'Ov23liTmVOZ9yVptSe17'
GITHUB_CLIENT_SECRET= '1690c0c8c72d20c28670c025c8b003e5c596bafc'

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET'],
            scope: 'user:email',
            callback_url: "http://localhost:3000/auth/github/callback"
    
    # Thêm bảo vệ CSRF
    OmniAuth.config.request_validation_phase = lambda do |env|
        csrf_token = env['rack.session']['_csrf_token']
        if csrf_token
            return
        else
            [422, {}, ['Cannot authenticate']]
        end
    end
end
