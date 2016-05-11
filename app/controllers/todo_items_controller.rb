class TodoItemsController < ApplicationController
  before_filter :set_todo_list
  before_filter :set_todo_item, only: [:show, :edit, :update, :destroy]

  # GET todo_lists/1/todo_items/1
  # GET todo_lists/1/todo_items/1.json
  def show
    respond_to do |format|
      format.json { render json: @todo_item }
      format.js #show.js.coffee
    end
  end

  # GET todo_lists/1/todo_items/new
  # GET todo_lists/1/todo_items/new.json
  def new
    @todo_item = TodoItem.new

    respond_to do |format|
      format.json { render json: @todo_item }
      format.js #new.js.coffee
    end
  end

  # GET todo_lists/1/todo_items/1/edit
  def edit
    respond_to do |format|
      format.js # edit.js.coffee
    end
  end

  # POST todo_lists/1/todo_items
  # POST todo_lists/1/todo_items.json
  def create
    @todo_item = TodoItem.new(params[:todo_item])
    @todo_list.todo_items << @todo_item

    respond_to do |format|
      if @todo_item.save
        format.json { render json: @todo_item, status: :created, location: @todo_item }
        format.js #create.js.coffee
      else
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
        format.js { render action: "new" }
      end
    end
  end

  # PUT todo_lists/1/todo_items/1
  # PUT todo_lists/1/todo_items/1.json
  def update
    respond_to do |format|
      if @todo_item.update_attributes(params[:todo_item])
        format.json { head :no_content }
        format.js #update.js.coffee
      else
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
        format.js { render action: "edit" }
      end
    end
  end

  # DELETE todo_lists/1/todo_items/1
  # DELETE todo_lists/1/todo_items/1.json
  def destroy
    @todo_item.destroy

    respond_to do |format|
      format.html { redirect_to [@todo_list], notice: 'Todo item deleted successfully.' }
      format.json { head :no_content }
    end
  end

  private
    def set_todo_list
      @todo_list = TodoList.find params[:todo_list_id]
    end

    def set_todo_item
      @todo_item = TodoItem.find(params[:id])
    end

end
