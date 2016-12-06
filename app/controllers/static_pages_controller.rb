class StaticPagesController < ApplicationController
  def index
    
    if user_signed_in?
     @user = User.all  
    end

    @company = Company.new
  end

  def home
  end

  def help
  end


end

