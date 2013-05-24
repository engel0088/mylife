class UsersController < ApplicationController
   # only admin should be able to visit

   def index
      @users=User.all
   end

   def new
      @user=User.new
   end

   def destroy
      @user=User.find(params[:id])
      @user.destroy
      flash[:info]="User successfully deleted!"
      redirect_to users_path
   end
end
