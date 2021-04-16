class TasksController < ApplicationController
    before_action :current_task, except: [:create]
    before_action :task_status, except: [:create]

    # Notes
      # 1. We soft delete tasks. Deleted tasks should not show up in the UI,
      #    but they are not permanently deleted from the database
      # 2. When a task list is deleted, all of its tasks are hard deleted
      #    TODO: turn hard deletes into soft deletes

    # POST /task_lists/:task_list_id/tasks
    def create
      task_list = TaskList.find(params[:task_list_id])
      task = task_list.tasks.create(new_task_params)
      if !task.valid?
        flash[:alert] = "Error creating task #{new_task_params[:name]}"
      end
      redirect_to task.task_list
    end

    # GET /task_lists/:task_list_id/tasks/:task_id/mark_active
    def mark_active
      current_task.update(status: Task.active_task_status)
      redirect_to current_task.task_list
    end

    # GET /task_lists/:task_list_id/tasks/:task_id/mark_finished
    def mark_finished
      current_task.update(status: Task.finished_task_status)
      redirect_to current_task.task_list
    end

    # DELETE /task_lists/:task_list_id/tasks/:task_id
    def destroy
      current_task.update(status: Task.deleted_task_status)
      redirect_to current_task.task_list
    end

    private
    
    def current_task
      Task.find(params[:id])
    end

    def new_task_params
      params.require(:task).permit(:name)
    end
end
