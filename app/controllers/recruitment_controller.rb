class RecruitmentController < ApplicationController
  def index
  end
  def hello
  end
  def welcome
   @user = current_user
   if !@user
     redirect_to root_path
   end
  end
end
