class AppointmentsController < ApplicationController
  def index
    @user = current_user
    if @user.teacher
      @appointments = @user.teacher_appointments.where("date < ?", Time.now)
      @upcoming_appointments = @user.teacher_appointments.where("date > ?", Time.now)
    else
      @appointments = @user.student_appointments.where("date < ?", Time.now)
      @upcoming_appointments = @user.student_appointments.where("date > ?", Time.now)
    end
  end

  def show
    @appointment = appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.teacher = current_user
    @appointment.student = User.find(params[:user_id])
    raise
    if @appointment.save
      redirect_to appointments_path
    else
      render "users/show"
    end
    authorize @appointment
  end

  def destroy
    @appointment = appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:comment, :date, :student)
  end
end
