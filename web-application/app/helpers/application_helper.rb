# This class contain function that can called by the view to show some piece of
# code
module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then 'alert alert-info alert-dismissable'
    when 'success' then 'alert alert-success alert-dismissable'
    when 'error' then 'alert alert-danger alert-dismissable'
    when 'alert' then 'alert alert-danger alert-dismissable'
    end
  end
end
