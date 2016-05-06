class TopicsController < ApplicationController

  def show
    @topic = Topic.find_by(id: params[:id])
    @appointments = @topic.appointments
  end

end
