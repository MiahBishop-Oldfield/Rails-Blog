class LoginsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(login_params)

    if @user
      redirect_to dashboards_path

    else
      flash[:alert] = "Incorrect email or password."
      render :new, status: :unprocessable_entity
  end
end
