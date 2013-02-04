class ConfirmationsController < Devise::ConfirmationsController
  protected
  def after_confirmation_path_for(resource_name, resource)
    hello_index_path
  end
end