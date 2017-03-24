require 'rails_helper'

RSpec.describe "accounts/index", type: :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        :account => "Account",
        :user => nil
      ),
      Account.create!(
        :account => "Account",
        :user => nil
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => "Account".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
