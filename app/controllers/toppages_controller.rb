class ToppagesController < ApplicationController
  def index
    if current_user
      @tasks = current_user.tasks.where(finishment: false)
    end
  end
end
