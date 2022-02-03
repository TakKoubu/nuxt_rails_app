module Api
  class MemosController < ApplicationController
    def index
      render json: Memo.all
    end

    def create
      memo = Memo.new(memo_params)
      memo.user_id = 1
      memo.content.to_s
      binding.pry
      if memo.save
        render json: memo
      else
        render json: memo.errors, status: 422
      end
    end

    def destroy
      memo = Memo.find(params[:id])
      memo.destroy!
      render json: memo
    end

    private

    def memo_params
      params.require(:memo).permit(:content)
    end
  end
end
