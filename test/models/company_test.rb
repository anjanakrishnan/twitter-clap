require 'test_helper'

class CompanyTest < ActiveSupport::TestCase

	 def setup
    @company = Company.new(name: "Example company")
  end

  test "should be valid" do
    assert @company.valid?
  end

    test "name should be present" do
    @company.name = "  "
    assert_not @company.valid?
  end

  # test "the truth" do
  #   assert true
  # end
end
