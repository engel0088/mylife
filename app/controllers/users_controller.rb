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

   ## add administrator into empty DB
   def init_user
      @admin= User.find_by_email('admin@mylife.com')
      if @admin.nil?
        @user=User.new
        @user.email='admin@mylife.com'
        @user.password='qwerqwer'
        @user.password_confirmation='qwerqwer'
        @user.role=User.admin
        @user.save
        flash[:info]="Admin user newly added."
      else
        flash[:info]="Admin user already exists."
      end
      redirect_to root_url
   end
end
