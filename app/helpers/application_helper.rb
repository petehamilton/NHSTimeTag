module ApplicationHelper
  def flash_div(*args)
    puts args.inspect
    options = args.extract_options!
    puts args.inspect
    
    divs = args.collect { |key| content_tag(:div, flash[key], :class => "flash #{key}") if flash[key] }.join || ''
    
    # js = ""
    # if options[:fade] != false && divs != ""
      # js += "$(function() {"
      # js += args.collect { |key| "$(\".flash.#{key}\").effect(\"pulsate\", { times:2 }, 600).delay(5000).slideUp(500);" if flash[key] }.join
      # js += "});"
    # end
    
    return divs # + (javascript_tag js)
  end
end
