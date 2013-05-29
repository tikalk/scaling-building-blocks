module ApplicationHelper
  # Primary link for Twitter Bootstrap,
  # if current controller is active return the link wrapped in li with 'active' class. 
  # <%= nav_primary_link_to 'Home', root_path, 'home' %> will make Home nav link
  #   active if current page belongs to controller 'home'.
  def nav_primary_link_to(link_text, link_path, in_controller_name, action_name = nil, options = nil)
    class_name = (controller_name == in_controller_name) ? 'active' : ''
  	#::Rails.logger.info "$$$ Current controller:  #{controller_name}"
  	if !action_name.nil?  
  	  if controller_name == in_controller_name && params[:action] != action_name
  	  	class_name = ''
  	  end
  	end

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path, options
    end
  end
end
