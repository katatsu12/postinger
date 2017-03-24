require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  before(:each) do
    assign(:account, Account.new(
      :account => "MyString",
      :user => nil
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input#account_account[name=?]", "account[account]"

      assert_select "input#account_user_id[name=?]", "account[user_id]"
    end
  end
end
