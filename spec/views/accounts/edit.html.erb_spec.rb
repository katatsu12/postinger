require 'rails_helper'

RSpec.describe 'accounts/edit', type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
                                  account: 'MyString',
                                  user: nil
    ))
  end

  it 'renders the edit account form' do
    render

    assert_select 'form[action=?][method=?]', account_path(@account), 'post' do
      assert_select 'input#account_account[name=?]', 'account[account]'

      assert_select 'input#account_user_id[name=?]', 'account[user_id]'
    end
  end
end
