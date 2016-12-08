class CompaniesController < ApplicationController
  def index
    @company = Company.new
  end
    def create
      @company = Company.new(company_params)
      @company.save
      @user = current_user
      last_id = Company.maximum('id')
      @user.update(company_id: last_id)
      redirect_to static_pages_dashboard_path
  end
  def company
  end

    private
    def company_params
      params.require(:company).permit(:name)
    end
end
