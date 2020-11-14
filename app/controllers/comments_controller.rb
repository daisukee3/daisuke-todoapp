class CommentsController < ApplicationController
    def new
        task = Task.find(params[:task_id])
        @comment = task.comments.build
    end

    def create
        task = Task.find(params[:task_id])
        @comment = task.comments.build(comment_params)
        if @comment.save
            redirect_to task_path(task), notice:'コメント追加'
        else
            flash.now[:error] = '更新出来ませんでした'
            render :new
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content)
    end

end

