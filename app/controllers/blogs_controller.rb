class BlogsController < ApplicationController
  skip_before_filter :require_login, :only => [:index]
  
  # GET /blog
  def index
    if(params[:topic])
      if(params[:topic] == "all")
        @blogs = Blog.order(:topic_id)
      else
        @blogs = Blog.where(:topic_id => params[:topic]).order('created_at desc')
      end
    elsif(params[:year] && params[:half])
      if(params[:half] == "1")  
        @blogs = Blog.where(:created_at => ((params[:year]+"-01-01").to_date)..((params[:year]+"-06-30").to_date)).order('created_at desc')
      else
        @blogs = Blog.where(:created_at => ((params[:year]+"-07-01").to_date)..((params[:year]+"-12-31").to_date)).order('created_at desc')
      end
    elsif(params[:name])
      @blogs = Blog.where(:name => params[:name])
    else
      @blogs = Blog.order('created_at desc').limit(5)
    end
    
    @topics = Topic.order(:name)
    
    set_constants
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    @topics = Topic.all
    
    set_constants
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
    @topics = Topic.all
  end

  # POST /blogs
  def create
    @blog = Blog.new(params[:blog])
    @blog.user_id = current_user.id
    
    image = params[:blog][:image_path] 
    
    @blog.image_path = image.original_filename
    
    File.open(Rails.root.join('public', 'blog', image.original_filename), 'wb') do |file|
      file.write(image.read)
    end

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_url }
      else
        @topics = Topic.all
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /blogs/1
  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to blog_url }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blog_url }
    end
  end
  
  private
  
  def set_constants
    @title = t('blog.title') 
    @description = t('blog.description')
    @keywords = t('blog.keywords')
    @blog_active = "active" 
  end
  
end
