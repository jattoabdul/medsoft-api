module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]
      skip_before_action :authenticate_request, only: %i[login create]

      # GET /users - ALL STAFF USERS
      def index
        @users = User.all

        render json: @users
      end

      # GET /users/1 - SINGLE STAFF USER
      def show
        render json: @user
      end

      # POST /users - REGISTER METHOD
      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # POST /auth/login - LOGIN/AUTHENTICATE USER METHOD
      def login
        authenticate params[:username], params[:email], params[:password]
      end

      # PATCH/PUT /users/1 - EDIT STAFF USER
      def update

        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/1 DELETE STAFF USER
      def destroy
        @user.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end

        # Authenticate user on call of login
        def authenticate(username, email, password)
          command = AuthenticateUser.call(username, email, password)
      
          if command.success?
            render json: {
              access_token: command.result,
              message: 'Login Successful'
            }
          else
            render json: { error: command.errors }, status: :unauthorized
          end
        end

        # Only allow a trusted parameter "white list" through.
        def user_params
          params.permit(:reg_id, :full_name, :username, :sex, :password, :password_confirmation, :address, :phone_number, :email, :date_employed, :is_admin)
        end
    end
  end
end