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
      @user.update!(user_email: user_params[:user_email])
      @user.update!(role: user_params[:role])
      render :template => '/static_pages/_admin'

  end
  def company
  end
    private
    def company_params
      params.require(:company).permit(:name)
    end
    def user_params
      params.require(:user).permit(:user_email, :role)      
    end
end
