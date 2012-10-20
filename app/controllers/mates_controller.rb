class MatesController < ApplicationController
  before_filter :setup_github, :only => [:index]
  
  def index
    
    respond_to do |format|
       format.html {}
    end
  end
  
  private
    def setup_github
      #aise unless params[:username].present? || params[:repo].present?
      @username, @repo_name = params[:username].to_s, params[:repo].to_s
      # @github = Github.new
      #       @repository = @github.repos.commits.all  @username, @repo_name
    end
end
