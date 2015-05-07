class StaticPagesController < ApplicationController
  def home

  end

  def about
    @users = User.all

  end

  def upload
    @requestId = params[:requestId]
  end

  def recomand
  end
end
