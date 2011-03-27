class TodosController < ApplicationController
  before_filter :require_user

  def create
    @list = List.find(params[:list_id])
    @todo = @list.todos.create(params[:todo])
  end
  
  def update
    @todo = Todo.find(params[:id])
    @list = @todo.list
    @todo.update_attributes(params[:todo])
  end
end
