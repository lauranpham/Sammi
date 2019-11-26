class DailyEmotionsController < ApplicationController

  def new
    @user = current_user
    @daily_emotion = DailyEmotion.new
  end

  def create
    @daily_emotion = DailyEmotion.new(daily_emotion_params)
    @daily_emotion.user = current_user
    if @daily_emotion.save
      redirect_to new_daily_emotion_path
    else
      render "subjects/show"
    end
  end

  def destroy
    @daily_emotion = daily_emotion.find(params[:id])
    @daily_emotion.destroy
    redirect_to daily_emotions_path
  end

  private

  def daily_emotion_params
    params.require(:daily_emotion).permit(:emotion_id)
  end
end
