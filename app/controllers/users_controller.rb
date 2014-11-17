class UsersController < ApplicationController
 
  before_filter :ensure_logged_in, only: [:create, :destroy]

  def index
    @reviews = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to products_url,notice:"Signed up!"
    else
      render "new"
    end
  end

  def show

    @user = User.find(params[:id])

  end
  
  def edit
    @user =  User.find(params[:id]) 
  end

  def update
    @user = User.find(params[:id])

    if @review.update_attributes(user_params)
      redirect_to product_path(@product) 
      # To defin the specific product 
    else
      render :edit
    end
  end

 def destroy
    @user = User.find(params[:id])
    @user.destroy
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name,:user_id)
  end

# ここでのパーミッションにIDを含めず何度も死んでいる。
end
