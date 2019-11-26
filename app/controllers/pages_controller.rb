class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @daily_emotion = DailyEmotion.new
  end
end
