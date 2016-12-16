class CompaniesController < ApplicationController
  def index
    @company = Company.new
    @user = User.new   
  end

  def create
      @company = Company.new(company_params)
      @company.save
      @user = current_user
      last_id = Company.maximum('id')
      @user.update(company_id: last_id)
      @user.update!(email: user_params[:email])
      @user.update!(role: user_params[:role])
      redirect_to root_url
      #render :template => '/static_pages/_admin'

  end
  def company
  end
    private
    def company_params
      params.require(:company).permit(:name)
    end
    def user_params
      params.require(:user).permit(:email, :role)      
    end
end
