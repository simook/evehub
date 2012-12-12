class Admin::SerenityController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @jobs = DelayedJob.all
    render :layout => 'hub'
  end

  def destroy
   authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
   @job = DelayedJob.find(params[:id])
   @job.destroy
   redirect_to admin_serenity_index_path, :notice => "Job deleted."
  end

end
