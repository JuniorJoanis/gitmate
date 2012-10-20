class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :setup_github
     
  private
    def setup_github
      if session[:github_access_token]
       @github = Github.new(:oauth_token => session[:github_access_token])
      # @github = Github.new :client_id => Gitmate::Application.config.client_id, :client_secret => Gitmate::Application.config.client_secret 
      else
        @github = Github.new :client_id => Gitmate::Application.config.client_id, :client_secret => Gitmate::Application.config.client_secret 
      end
    end
end
