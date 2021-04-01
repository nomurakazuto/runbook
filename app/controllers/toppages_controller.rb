class ToppagesController < ApplicationController
  def index
    @tasks = current_user.tasks.where(finishment: false)
  end
end
