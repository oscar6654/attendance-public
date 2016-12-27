class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
 
 
  helper_method :mailbox, :conversation
  # def after_sign_in_path_for(resource_or_scope)
  #       mailbox_inbox_path
  # end
  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end     
  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
  protected
 
  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :name
   devise_parameter_sanitizer.for(:sign_up) << :sss_id
   devise_parameter_sanitizer.for(:sign_up) << :is_male
   devise_parameter_sanitizer.for(:sign_up) << :birthday
   devise_parameter_sanitizer.for(:sign_up) << :starting_date
   devise_parameter_sanitizer.for(:sign_up) << :tin_id
   devise_parameter_sanitizer.for(:sign_up) << :pag_ibig_no
   devise_parameter_sanitizer.for(:sign_up) << :phil_health
   devise_parameter_sanitizer.for(:sign_up) << :role
   devise_parameter_sanitizer.for(:account_update) << :avatar
  end
  





end
