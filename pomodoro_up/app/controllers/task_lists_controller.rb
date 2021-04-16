class TaskListsController < ApplicationController
    before_action :authorize
    before_action :task_status, only: [:show]

    # /task_lists
    def index
        @task_lists = current_user.task_lists
    end

    # /task_lists
    def show
        @task_list = TaskList.find_by(id: params[:id], user_id: current_user.id)
        if @task_list.nil?
            render "not_found"
            return
        end

        @active_tasks = @task_list.tasks.where.not(status: @deleted_task_status).all
        @new_task = @task_list.tasks.new
    end
end
