class SubjectsController < ApplicationController
  def index
    @subjects = policy_scope(Subject)
  end

  def show
    @subject = Subject.find(params[:id])
    authorize @subject
  end

  def new
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
