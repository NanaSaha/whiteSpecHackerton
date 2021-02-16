class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def create_user

    username = params[:user][:username]
    email = params[:user][:email]  

    @user = User.create_user(username, email)  

      if @user.save

      render json: {"status": 200, "message": "New User Created"}
      else
         render json: {"status": 400, "message": "Error!!"}
      end

  end

  # POST /users or /users.json
  def create
    
    username = params[:user][:username]
    email = params[:user][:email]

    @user = User.new({:username => username, :email => email })

      if @user.save
      render json: {"status": 200, "message": "New User Created"}
      else
      render json: {"status": 400, "message": "Error!!"}
      end

  end

 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email)
    end
end
