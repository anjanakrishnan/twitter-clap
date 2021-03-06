class CompaniesController < ApplicationController
  def index
    @company = Company.new
    @user = User.new   
  end

  def create
      @company = Company.new(company_params)
      @company.save
      @email_check = User.all
      if user_params[:email] == ""  
        if company_params[:name] == ""
          redirect_to root_url
        else
          redirect_to root_url
        end
      elsif company_params[:name] == ""
          redirect_to root_url
        else
        @email_check.each do |c|
          if c.email == user_params[:email]
            flash[:danger] = "cannot be blank"
            redirect_to root_url
          else
             @user = current_user
            
            @user.update(company_id: @company.id)
            @user.update!(email: user_params[:email])
            @user.update!(role: user_params[:role])
            redirect_to root_url
          end
        end
      end
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
