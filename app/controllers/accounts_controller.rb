class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update destroy]

  def index
    @accounts = Account.all
  end

  def show; end

  def new
    @account = Account.new
  end

  def edit; end

  def create
    @account = Account.new(account_params)
    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
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
