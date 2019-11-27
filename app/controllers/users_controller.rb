class UsersController < ApplicationController
  def show
    @student = User.find(params[:id])
    @daily_emotions = @student.emotions
    authorize current_user
  end
end
