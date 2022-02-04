module Api
  class GoodwillsController < ApplicationController

    def create
      memo = Memo.find(params[:like_id])
      user = User.find(1)
      user.like(memo)
    end

    def destroy
      memo = Memo.find(params[:like_id])
      user = User.find(1)
      user.unlike(memo)
      flash[:success] = 'likeを外しました。'
    end
  end
end
