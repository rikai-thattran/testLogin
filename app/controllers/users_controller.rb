class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @users = User.all
        respond_to do |format|
            format.html
            format.json { render json: @users }
        end
    end
    def create
        user = User.new(user_params)

        if user.save
            render json: {
                message: 'Tạo user thành công',
                user: user
            }
        else
            render json: {
                message: 'Tạo user thất bại'
            }
        end
    end
    def edit
        # byebug  
        users = User.find(params[:id])
        render json: users 
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
         render json: {
            message: 'update user thành công',
        }
        else
            render json: {
                message: 'update user không thành công thành công',
            }
        end
    end  
    def destroy
        @user = User.find(params[:id])

        if @user.present?
          @user.destroy
          render json: { message: 'Xóa user thành công' }
        else
          render json: { message: 'Xóa user không thành công' }
        end
    end
    
      
    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
      end
end
