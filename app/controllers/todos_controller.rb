class TodosController < ApplicationController
  before_filter :require_user

  def create
    @list = List.find(params[:list_id])
    @todo = @list.todos.create(params[:todo])
    
    redirect_to list_path(@list)
  end
  
  def update
    
    @todo = Todo.find(params[:id])
    @list = @todo.list
    
    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to list_path(@list) }
        format.xml  { head :ok }
      else
        format.html { render :controller => "list", :action => "index" }
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
      end
    end
  end
end
