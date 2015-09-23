class TasksController < ApplicationController

  # GET /tasks
  def index
    @tasks = policy_scope(Task)
    skip_authorization
  end

  # GET /tasks/1
  def show
    @task = Task.find(params[:id])
    skip_authorization
  end

  # GET /tasks/new
  def new
    @task = Task.new
    skip_authorization
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    authorize @task
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    skip_authorization
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /tasks/1
  def update
    @task = Task.find(params[:id])
    authorize @task
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tasks/1
  def destroy
    @task = Task.find(params[:id])
    authorize @task
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :due_date, :completed, :user_id)
    end
end
