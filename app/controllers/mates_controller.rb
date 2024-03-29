class MatesController < ApplicationController
  before_filter :setup_mates
   
  def index
    @markers = @users.to_json
    respond_to do |format|
       format.html {}
       format.json {render :json => @markers}
    end 
  end
  
  private
    def setup_mates
      return unless params[:username].present? ||  params[:repo].present?
      #raise unless params[:username].present? || params[:repo].present?
      @username, @repository_name = params[:username].to_s, params[:repo].to_s
      @users = Mate.in_repo @username, @repository_name
    end
end
