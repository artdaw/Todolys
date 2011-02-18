class HomeController < ApplicationController
  def index
    if current_user
      redirect_to lists_path
    end
  end

end
