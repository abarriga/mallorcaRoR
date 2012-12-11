class HomeController < ApplicationController
  skip_before_filter :require_login, :only => [:index]
  
  # GET /
  def index
    @meetups = Meetup.order('created_at desc').limit(3);
    @posts = Blog.order('created_at desc').limit(8);
    @users = User.all
    
    set_constants
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  private
  
  def set_constants
    @title = t('home.title') 
    @description = t('home.description')
    @keywords = t('home.keywords')
    @home_active = "active" 
  end
end
