module ApplicationHelper
  # Primary link for Twitter Bootstrap,
  # if current controller is active return the link wrapped in li with 'active' class. 
  # <%= nav_primary_link_to 'Home', root_path, 'home' %> will make Home nav link
  #   active if current page belongs to controller 'home'.
  def nav_primary_link_to(link_text, link_path, controller, path = nil, options = nil)
    class_name = (controller_name == controller) ? 'active' : ''
	#::Rails.logger.info "$$$ Current controller:  #{controller_name}"
	if !path.blank?
	  if controller_name == controller && request.fullpath != path
	  	class_name = ''
	  end
	end

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path, options
    end
  end

end
