class BoardsController < ApplicationController
    def index
        @boards = Board.all
    end

    def show
        @board = Board.find(params[:id])
    end

    def new
        @board = Board.new
    end

    def edit
        @board = Board.find(params[:id])
    end

    def update
        @board = Board.find(params[:id])
        if @board.update(board_params)
            redirect_to board_path(@board), notice: '更新出来ました'
        else
            flash.now[:error] = '更新出来ませんでした'
            render :edit
        end
    end

    def destroy
        board = Board.find(params[:id])
        board.destroy!
        redirect_to root_path, notice: '削除に成功しました'
    end

    private
    def board_params
        params.require(:board).permit(:title, :content)
    end
end