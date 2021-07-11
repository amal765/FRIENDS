# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    resource.save
    if resource.save
      flash[:info] = 'registration completed successfully'
      redirect_to new_user_session_path
    else
      flash[:info] = 'something went wrong, try again'
      redirect_to new_user_registration
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :street, :city, :state, :country)
  end
end
