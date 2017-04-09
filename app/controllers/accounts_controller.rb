class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.where(user_id: current_user.id)
  end

  def show;end

  def new
    @account = Account.new
  end

  def edit; end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to @account, notice: 'Account was successfully created.'
    else
      render :new
    end
  end

  def update
    if @account.update(account_params)
      redirect_to @account, notice: 'Account was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_url, notice: 'Account was successfully destroyed.'
  end

  def get_vk_token
    vk_url = 'https://oauth.vk.com/authorize?client_id=5963835&scope=groups,wall,offline,photos&redirect_uri=https://oauth.vk.com/blank.html&display=page&response_type=token'
    redirect_to vk_url
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:account, :user_id, :email, :provider, :token_vk)
  end
end
