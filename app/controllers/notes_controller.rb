class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    @note.teacher = current_user
    @note.student = User.find(params[:user_id])
    authorize @note
    if @note.save
      redirect_to subject_user_path(Subject.find(params[:subject_id]), @note.student)
    else
      render 'users/show'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to subject_user_path(Subject.find(params[:subject_id]), @note.student)
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
