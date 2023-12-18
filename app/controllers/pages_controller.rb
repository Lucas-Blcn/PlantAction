class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def my_posts
    if user_signed_in?
      @plants = current_user.plants
    end
  end

  def my_bookings
    if user_signed_in?
      @bookings = current_user.bookings
    end
  end
end
