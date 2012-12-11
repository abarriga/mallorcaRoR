class TopicsController < ApplicationController
  # GET /topics
  def index
    @topics = Topic.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /topics/1
  def show
    @topic = Topic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /topics/new
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  def create
    @topic = Topic.new(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, :notice => 'Topic was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /topics/1
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, :notice => 'Topic was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /topics/1
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
    end
  end
end
