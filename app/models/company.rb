class Company < ApplicationRecord
	validates :name,  format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}, presence: true, length: {maximum: 30}

end
