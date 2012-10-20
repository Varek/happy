class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    redirect_to welcome_path
  end
end