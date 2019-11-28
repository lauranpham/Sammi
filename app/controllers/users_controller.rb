class UsersController < ApplicationController
  def show
    @subject = Subject.find(params[:subject_id])
    @appointment = Appointment.new
    @user = current_user
    @student = User.find(params[:id])
    @daily_emotions = @student.daily_emotions
    @dailynumber = @daily_emotions.map { |emo| [emo.date, emo.emotion.number] }
    authorize current_user
  end
end
