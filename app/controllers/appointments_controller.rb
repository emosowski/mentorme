class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.mentor_id = current_user.id
    @topics = params[:appointment][:topics].split(' ')
    @topics.each do |topic|
      @appointment.topics << Topic.find_or_create_by(name: topic)
    end

    if @appointment.save
      redirect_to user_path(current_user.id)
    end
  end

  def index
    @appointments = Appointment.all
  end

  def update
    @appointment = Appointment.find_by(id: params[:id])
    @appointment.student_id = current_user.id
    redirect_to user_path(current_user.id)
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
  end

  private
    def appointment_params
      params.require(:appointment).permit(:date, :start_time, :end_time, :mentor_phase)
    end

end
