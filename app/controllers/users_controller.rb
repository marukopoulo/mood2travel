class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
oauth = Koala::Facebook::OAuth.new(*Devise.omniauth_configs[:facebook].args)
graph = Koala::Facebook::API.new(oauth.get_app_access_token)
begin
  graph.put_connections current_user.uid, 'feed', message: 'メッセージ', link: 'http://example.com/'
rescue Koala::Facebook::ClientError
  # ignore permission errors
end

  end
end
