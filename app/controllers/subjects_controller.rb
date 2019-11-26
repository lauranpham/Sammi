class SubjectsController < ApplicationController
  def index
    @user = current_user
    @subjects = policy_scope(Subject) if @user.teacher? # Subject.where(user: current_user)
  end

  def show
    @subject = Subject.find(params[:id])
    authorize @subject, :show?
  end

  def new
    @user = current_user
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.user = current_user
    @subject.pet = Pet.find(params[:pet_id])
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
  end
end
