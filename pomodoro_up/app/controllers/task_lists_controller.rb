class TaskListsController < ApplicationController
    before_action :authorize
    # /task_lists
    def index
        @task_lists = current_user.task_lists
    end

    # /task_lists
    def show
        @task_list = TaskList.find(params[:id])
    end
end
