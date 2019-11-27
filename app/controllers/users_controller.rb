class UsersController < ApplicationController
  def show
    @student = User.find(params[:id])
    @daily_emotions = @student.daily_emotions
    @dailynumber = @daily_emotions.map { |emo| [emo.date, emo.emotion.number] }
    authorize current_user
    @appointment = Appointment.new
  end
end
