class StaticController < ApplicationController
  def index
    if logged_in?
      redirect_to attractions_path
    end
  end
end
