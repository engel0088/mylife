class UsersController < ApplicationController
   def index
     @users=User.all
     
   end

   def show
     @user=User.find(params[:id])
   end

   def new
      @user=User.new
   end
   
   def edit
      @user=User.find(params[:id])
   end

   def create
      @user=User.new(params[:user])
      if @user.save then
         flash[:notice]="New user successfully added."
      else
         flash[:notice]="Exception occured in adding new user."
      end

      redirect_to users_url
   end

   def update
      @user=User.find(params[:id])
      if @user.update_attributes(params[:user]) then
         flash[:notice]="User successfully updated."
         redirect_to user_url(@user)
      end
   end

   def destroy
      @user=User.find(params[:id])
      flash[:notice]="User #{@user.name} removed!"
      @user.destroy

      redirect_to users_url
   end
end
