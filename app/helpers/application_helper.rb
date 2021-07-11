module ApplicationHelper

  def nav_link(text=nil, url=nil, icon=nil, wrapper_options={}, input_html={}, &block)
    url ||= text || ''
  	input_html[:class] = "#{input_html[:class]} #{'active' if current_page?(url)}"
  	content_tag(wrapper_options[:wrapper_elem] || :li, wrapper_options) do
  	  link_to url, input_html do
  	    if block_given?
  	      capture(&block)
  	    else
  	      content_tag(:i, nil, {class: icon.to_s}).concat(
  	        content_tag(:span, text)
  	      )
  	    end  
  	  end
  	end
  end

  def tree_link(text=nil, icon=nil, options={}, &block)
    (<<-HTML
      <li class="treeview">
        <a href="#">
          <i class='#{icon}'></i>
          <span>#{text}</span>
          <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
          </span>
        </a>
        <ul class="treeview-menu">
          #{capture(&block)}
        </ul>
      </li>
    HTML
    ).html_safe
  end

  def file_help name
    (<<-HTML
      <label for="#{name}"><span></span> <strong><i class="fa fa-upload"></i> Choose a file…</strong></label>
    HTML
    ).html_safe
  end

  def progress_bar(color=nil, percentage=0, bg=nil)
    (<<-HTML
    <td style="width: 300px">
      <div class="progress progress-xs progress-striped active">
        <div class="progress-bar progress-bar-#{color}" style="width: #{percentage}%"></div>
      </div>
    </td>
    <td>
      <span class="badge bg-#{bg}">#{percentage}%</span>
    </td>
    HTML
    ).html_safe
  end
  
  def admin?
    current_user.admin?
  end

end
