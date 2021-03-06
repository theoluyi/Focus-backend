class MeditationSessionsController < ApplicationController
  before_action :authorized, only: [:create]

  def create 
    @meditation_session = @user.meditation_sessions.create(meditation_session_params)
    if @meditation_session.valid?
      render json: @meditation_session
    else
      render json: {error: "Something went wrong, please try again"}
    end
  end

  def index 
    @meditation_sessions = MeditationSession.all 
    render json: @meditation_sessions
  end

  def destroy 
    @meditation_session = MeditationSession.find_by(id: params[:id])
    @meditation_session.destroy
  end


  private

  def meditation_session_params
    params.permit(:start_time, :end_time, :duration, :note)
  end
  
end
