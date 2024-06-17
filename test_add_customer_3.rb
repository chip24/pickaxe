require "minitest/autorun"
require_relative "add_customer"

class TestAddCustomer < Minitest::Test
  def test_add
    customer = Customer.new("Ima", "Customer")
    fake_file = []
    customer.append_name_to_file(fake_file)
    assert_equal(["Ima"," ", "Customer"], fake_file)
  end
end