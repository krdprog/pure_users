module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]
      skip_forgery_protection

      # GET /api/v1/users
      def index
        @users = User.all
        if @users.present?
          render :index, status: :ok
        else
          render json: {status: 'ERROR', message: 'Users not found'}, status: :not_found
        end
      end

      # GET /api/v1/users/:id
      def show
        render :show, status: :ok
      end

      # POST /api/v1/users
      def create
        @user = User.new(user_params)

        if @user.save
          render json: {status: 'SUCCESS', message: 'Created user', data: @user}, status: :ok
        else
          render json: {status: 'ERROR', message: 'User not created', data: @user.errors}, status: :unprocessable_entity
        end
      end

      # PATCH, PUT /api/v1/users/:id
      def update
        if @user.update_attributes(user_params)
          render json: {status: 'SUCCESS', message: 'Updated user', data: @user}, status: :ok
        else
          render json: {status: 'ERROR', message: 'User not updated', data: @user.errors}, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/:id
      def destroy
        @user.destroy
        render json: {status: 'SUCCESS', message: 'Deleted user', data: @user}, status: :ok
      end

      private

      def set_user
        @user = User.find(params[:id])
        rescue Exception
          render json: {status: 'ERROR', message: 'User not found'}, status: :not_found
      end

      def user_params
        params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
      end
    end
  end
end
