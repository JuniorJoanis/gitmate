class GithubController < ApplicationController
  def authorize
    address = @github.authorize_url  :scope => 'repo user'
    redirect_to address
  end

  def callback
    authorization_code = params[:code]
    token = @github.get_token authorization_code
    session[:github_access_token] = token.token
    redirect_to mates_index_path
  end
end
