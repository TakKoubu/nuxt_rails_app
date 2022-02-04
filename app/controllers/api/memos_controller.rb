module Api
  class MemosController < ApplicationController
    def index
      render json: Memo.includes(:goodwills).all.to_json(methods: :goodwill_count)
    end

    def create
      memo = Memo.new(memo_params)
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
