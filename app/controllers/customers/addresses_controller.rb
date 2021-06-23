class Customers::AddressesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end

  def create
    @address = Address.new(params_address)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "新規配送先住所を登録しました"
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses
      flash[:notice] = "登録に失敗しました"
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(params_address)
      flash[:notice] = "配送先を変更しました"
      redirect_to addresses_path
    else
      flash[:notice] = "変更に失敗しました"
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:notice] = "配送先を削除しました"
    redirect_to addresses_path
  end


  private

  def params_address
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
