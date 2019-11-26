class SubjectsController < ApplicationController
  def index
    @subjects = policy_scope(Subject)
    @subject = Subject.new
  end

  def show
    @subject = Subject.find(params[:id])
    authorize @subject
  end

  def new
    @user = current_user
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.user = current_user
    authorize @subject
    if @subject.save
      redirect_to subjects_path
    else
      redirect_to pet_path(@subject.pet)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    authorize @subject
    redirect_to subjects_path
  end

  def subject_params
    params.require(:subject).permit(:name, :room, :photo)
  end
end
