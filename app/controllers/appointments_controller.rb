class AppointmentsController < ApplicationController
  def index
    @user = current_user if user.teacher
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
