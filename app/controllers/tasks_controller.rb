class TasksController < ApplicationController
    before_action :set_task, only: [:show]
    def index
        @tasks = Task.all
    end

    def show
    end

    def new
        @task = current_user.tasks.build
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
            redirect_to tasks_path(@task), notice: '保存完了'
        else
            flash.now[:error] = '保存失敗'
            render :new
        end
    end

    def edit
        @task = current_user.tasks.find(params[:id])
    end

    def update
        @task = current_user.tasks.find(params[:id])
        if @task.update(task_params)
            redirect_to task_path(@task), notice: '更新出来ました'
        else
            flash.now[:error] = '更新出来ませんでした'
            render :edit
        end
    end

    def destroy
        task = current_user.tasks.find(params[:id])
        task.destroy!
        redirect_to root_path, notice: '削除に成功しました'
    end

    private
    def task_params
        params.require(:task).permit(:title, :content)
    end

    def set_task
        @task = Task.find(params[:id])
    end
end
