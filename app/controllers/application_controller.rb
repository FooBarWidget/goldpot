class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :determine_layout

private
  def determine_layout
    if request.xhr?
      nil
    else
      'application'
    end
  end
  
  def link_to(*args)
    render_to_string(:inline => '<%= link_to(*args) %>', :locals => { :args => args })
  end
end
