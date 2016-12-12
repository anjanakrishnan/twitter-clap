class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      @user = User.all  
    end
    @company = Company.new
    @user = User.new
    @email = User.new
  end

  def home
  end

  def help
  end
end

