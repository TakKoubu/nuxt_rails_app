module Api
  class GoodwillsController < ApplicationController

    def create
      memo = Memo.find(params[:like_id])
      user = User.find(1)
      user.like(memo)
    end

  end
end
