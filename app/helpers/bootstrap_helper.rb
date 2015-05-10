module BootstrapHelper
  def alert_class(type)
    case type
    when "error"
      return "alert-danger"
    when "alert"
      return "alert-danger"
    when "notice"
      return "alert-warning"
    end
  end

  def glyphicon_tag(klass, title=nil)
    "<span class='glyphicon glyphicon-#{klass}'></span> #{title}".html_safe
  end

	def bootstrap_label_tag(type, content)
		# Type: default, primary, success, info, warning, danger
		"<span class='label label-#{type}'>#{content}</span>".html_safe
	end
end
