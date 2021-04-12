class TaskListsController < ApplicationController
    before_action :authorize
    # /task_lists
    def index
        @task_lists = current_user.task_lists
    end

    # /task_lists
    def show
        @task_list = TaskList.find_by(id: params[:id], user_id: current_user.id)
        if @task_list.nil?
            render "not_found"
        end
    end
end
