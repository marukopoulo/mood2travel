class StaticPagesController < ApplicationController
  def home

  end

  def about
      @users = User.all
  end

  def upload
  end
end
