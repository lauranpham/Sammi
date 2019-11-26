class UsersController < ApplicationController
  def show
    @student = User.find(params[:id])
    authorize current_user
  end
end
