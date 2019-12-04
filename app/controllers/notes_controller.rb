class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @note = Note.create(params[:id])
    @user = User.find(params[:id])
  end

  def create
    Noto
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
