class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_user

  def set_user
	return if current_user.blank?
	@logged_in_user = user_signed_in?? current_user : ''
  end

  private
  
  def current_cart
  	@current_cart ||= (Cart.find :last, :conditions => "user_id = #{current_user.id}") || (Cart.create! :user_id => current_user.id)
  end
  
end
