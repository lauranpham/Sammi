class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.where("end_date < ?", Time.now)
    @upcoming_appointments = appointment.where("end_date > ?", Time.now)
    @user = current_user
  end

  def show
    @appointment = appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.teacher = current_user
    if @appointment.save
      redirect_to appointments_path
    else
      render "users/show"
    end
  end

  def destroy
    @appointment = appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:comment, :date)
  end
end
