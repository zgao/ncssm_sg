module ApplicationHelper
  def td_active(str, path)
    match = request.path.match(/^#{path}$/)
    cls = match ? 'active' : ''
    haml_tag :td, class: cls do
      if match then haml_concat str else haml_concat link_to(str, path) end
    end
  end
end
