class CommentsController < ApplicationController
    def new
        task = Task.find(params[:task_id])
        @comment = task.comments.build
    end
end
