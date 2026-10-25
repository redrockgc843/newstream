class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Only allow modern browsers
  allow_browser versions: :modern

  # Invalidate etags when importmaps change
  stale_when_importmap_changes

  protected

  def configure_permitted_parameters
    # Additional fields during sign up
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[first_name last_name]
    )

    # Additional fields during account update
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[first_name last_name]
    )
  end
end
