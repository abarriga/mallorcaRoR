class MeetupsController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :show]
  
  # GET /meetups
  def index
    set_constants
    @meetups = Meetup.order('date desc')
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /meetups/1
  def show
    set_constants
    @meetup = Meetup.find(params[:id])
    @user = User.find(@meetup.user_id)

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /meetups/new
  def new
    set_constants
    @meetup = Meetup.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /meetups/1/edit
  def edit
    set_constants
    @meetup = Meetup.find(params[:id])
  end

  # POST /meetups
  def create
    set_constants
    @meetup = Meetup.new(params[:meetup])
    @meetup.user_id = current_user.id

    respond_to do |format|
      if @meetup.save
        format.html { redirect_to @meetup, notice: 'Meetup was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /meetups/1
  def update
    set_constants
    @meetup = Meetup.find(params[:id])

    respond_to do |format|
      if @meetup.update_attributes(params[:meetup])
        format.html { redirect_to @meetup, notice: 'Meetup was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /meetups/1
  def destroy
    set_constants
    @meetup = Meetup.find(params[:id])
    @meetup.destroy

    respond_to do |format|
      format.html { redirect_to meetups_url }
    end
  end
  
  private
  
  def set_constants
    @title = t('meetup.title') 
    @description = t('meetup.description')
    @keywords = t('meetup.keywords')
    @meetup_active = "active" 
  end
end
