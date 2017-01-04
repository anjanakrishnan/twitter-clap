class Company < ApplicationRecord
	validates :name, presence: { message: "Company is required"}, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}, length: {maximum: 30}
	
end
