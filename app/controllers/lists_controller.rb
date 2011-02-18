class ListsController < ApplicationController
  before_filter :require_user

  def index
    @lists = User.find(current_user.id).lists.order("created_at DESC")
    @list = List.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @lists }
    end
  end

  def show
    lists = Array.new
    User.find(current_user.id).lists.each do |list|
      if list.id == params[:id].to_i
        lists << list
      end
    end

    if lists.length > 1 
      raise "Todo list table cannot have 2 lists with the same ID" 
    end
      
    @list = lists[0]
    if !@list.nil?
      respond_to do |format|
        format.html
        format.xml  { render :xml => @list }
      end
    else
      redirect_to lists_path    
    end

  end


  def new
    @list = List.new

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @list }
    end
  end


  def edit
    @list = List.find(params[:id])
  end

  def create
    
    @user = User.find(current_user.id)
    @list = @user.lists.create(params[:list])

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list }
        format.xml  { render :xml => lists_path, :status => :created, :location => @list }
      else
        format.html { redirect_to lists_path }
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @list = List.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to(lists_path, :notice => "\"#{@list.name}\" list was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to(lists_url) }
      format.xml  { head :ok }
    end
  end
  
end
