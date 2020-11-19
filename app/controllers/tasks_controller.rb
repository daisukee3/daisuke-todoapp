class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def index
        @board = Board.find(params[:board_id])
        @tasks = @board.tasks.all
    end

    def show
        @comments = @task.comments
    end

    def new
        board = Board.find(params[:board_id])
        @task = board.tasks.build
    end

    def create
        @board = current_user.boards.find(params[:board_id])
        @task = @board.tasks.build(task_params.merge!(user_id: current_user.id))
        if @task.save
            redirect_to board_tasks_path(@board), notice: '保存完了'
        else
            flash.now[:error] = '保存失敗'
            render :new
        end
    end

    def edit
    end

    def update
        @board = Board.find(params[:board_id])
        @task = @board.tasks.find(params[:id])
        if @task.update(task_params)
            redirect_to board_task_path(@board, @task), notice: '更新出来ました'
        else
            flash.now[:error] = '更新出来ませんでした'
            render :edit
        end
    end

    def destroy
        board = Board.find(params[:board_id])
        task = board.tasks.find(params[:id])
        task.destroy!
        redirect_to board_tasks_path(board), notice: '削除に成功しました'
    end

    private
    def task_params
        params.require(:task).permit(:title, :content, :eyecatch)
    end

    def set_task
        @board = Board.find(params[:board_id])
        @task = @board.tasks.find(params[:id])
    end
end
