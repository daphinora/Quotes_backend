class UsersController < ApplicationController
    # skip_before_action :verify_authenticity_token
    
    def index
        users = User.all
        render json: users, except: [:created_at, :updated_at]
    end

    def create
        # byebug
        user = User.find_or_create_by(user_params)
        session[:user_id] = user.id

        render json: user, except: [:created_at, :updated_at]
    end

    private

        def user_params
            params.require(:user).permit(:username)
        end
end
