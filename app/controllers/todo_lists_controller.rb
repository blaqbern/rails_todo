class TodoListsController < ApplicationController
  before_filter :set_todo_list, only: [:show, :edit, :update, :destroy]

  # GET /todo_lists
  # GET /todo_lists.json
  def index
    @todo_lists = current_user.todo_lists.paginate(page: params[:page], per_page: 6)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todo_lists }
    end
  end

  # GET /todo_lists/1
  # GET /todo_lists/1.json
  def show
    @items = @todo_list.todo_items.paginate(page: params[:page], per_page: 6)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo_list }
    end
  end

  # GET /todo_lists/new
  # GET /todo_lists/new.json
  def new
    @todo_list = current_user.todo_lists.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todo_list }
      format.js # new.js.coffee
    end
  end

  # GET /todo_lists/1/edit
  def edit
    respond_to do |format|
      format.html # edit.html.erb
      format.js #edit.js.coffee
    end
  end

  # POST /todo_lists
  # POST /todo_lists.json
  def create
    @todo_list = current_user.todo_lists.new(params[:todo_list])

    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully created.' }
        format.json { render json: @todo_list, status: :created, location: @todo_list }
        format.js # create.js.coffee
      else
        format.html { render action: "new" }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todo_lists/1
  # PUT /todo_lists/1.json
  def update
    respond_to do |format|
      if @todo_list.update_attributes(params[:todo_list])
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully updated.' }
        format.json { head :no_content }
        format.js # update.js.coffee
      else
        format.html { render action: "edit" }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_lists/1
  # DELETE /todo_lists/1.json
  def destroy
    @todo_list.destroy

    respond_to do |format|
      format.html { redirect_to todo_lists_url }
      format.json { head :no_content }
    end
  end

  private
    def set_todo_list
      @todo_list = current_user.todo_lists.find params[:id]
    end

end
