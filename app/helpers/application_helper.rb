module ApplicationHelper
  def nav_link_to(*args, &block)
    options = args[1] || {}
    html_options = args[2] || {}
		html_options[:class] ||= ""

    link = link_to(*args, &block)
		html_options[:class] += " active" if current_page?(options)

    content_tag :li, link, class: html_options[:class]
  end

  def tab_nav_link_to(tab, *args, &block)
    options = args[1] || {}
		args[2] ||= {}
		args[2][:class] = selected_tab?(tab, options) ? 'active' : nil
		nav_link_to(*args, &block)
  end

	def dropdown_nav(*args, &block)
		name = args[0]
    options = args[1] || {}
    html_options = args[2] || {}
		caret = "<span class='caret'></span>"
		button = link_to("#{name} #{caret}".html_safe, options, class: "dropdown-toggle", data: {toggle: "dropdown"}, role: "button", "aria-expanded" => false)
		sublinks = content_tag(:ul, capture(&block), class: "dropdown-menu")
		dropdown_block = button + sublinks

		content_tag :li, dropdown_block, class: "dropdown #{html_options[:class]}"
	end

	def dropdown_tab_nav(tab, *args, &block)
    options = args[1] || {}
		args[2] ||= {}
		args[2][:class] ||= selected_tab?(tab, options) ? 'active' : nil
		dropdown_nav(*args, &block)
	end

  def content_for_header(title, description=nil)
		content_for :header do
			content = content_tag(:h2, title)
			content += content_tag(:p, description) if description
			container = content_tag(:div, content, class: "container")
			content_tag(:div, container, class: "ks-header")
		end
  end

  def link_to_add_fields(name, f, association, partial_prefix, opts={})
    new_object = f.object.send(association).klass.new
    id = new_object.object_id

		fields = f.simple_fields_for(association, new_object, child_index: id, wrapper: :horizontal_form) do |builder|
			render(partial_prefix.to_s + association.to_s.singularize + "_fields", f: builder)
		end

    link_to(name, '#', class: "add_fields btn btn-xs btn-primary #{opts[:klass]}", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
