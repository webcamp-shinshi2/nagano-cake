class Customers::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def confirm
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
       flash[:notice] = "登録情報を変更しました!"
       redirect_to customer_path
    else
       render :edit
    end
  end
  
  def out
    customer = current_customer 
    customer.update(is_deleted: true) 
    reset_session 
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path 
  end
  
  private
  def customer_params
    params.require(:customer).permit(:first_name, :first_name_kana, :last_name, :last_name_kana, :postal_code, :address, :phone_number, :email, :is_deleted)
  end
  
end
