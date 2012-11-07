module ApplicationHelper
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def id_to_name(id)
    begin
      EAAL.cache = EAAL::Cache::FileCache.new
      api = EAAL::API.new('','')
      api.scope = "eve"
      api.CharacterName(:ids=>id).characters.first.name
      #id
    rescue EAAL::Exception::EveAPIException => e
      flash[:error] = "#{e.message}"
    end
  end

  def type_id_to_name(id)
    begin
      EAAL.cache = EAAL::Cache::FileCache.new
      api = EAAL::API.new('','')
      api.scope = "eve"
      api.TypeName(:ids=>id).types.first.typeName
    rescue EAAL::Exception::EveAPIException => e
      flash[:error] = "#{e.message}"
    end
  end

  def type_icon(id,size)
    url = "http://image.eveonline.com/InventoryType/#{id}_#{size}.png"
    html = "<img src='#{url}' width='#{size}' height='#{size}' alt='#{type_id_to_name(id)}' />"
    return html.html_safe
  end

  def character_portrait(id,size)
    url = "http://image.eveonline.com/Character/#{id}_#{size}.jpg"
    html = "<img src='#{url}' width='#{size}' height='#{size}' alt='#{id_to_name(id)}' />"
    return html.html_safe
  end

  def corp_logo(id,size)
    url = "http://image.eveonline.com/Corporation/#{id}_#{size}.png"
    html = "<img src='#{url}' width='#{size}' height='#{size}' alt='#{id_to_name(id)}' />"
    return html.html_safe
  end

  def alliance_logo(id,size)
    url = "http://image.eveonline.com/Alliance/#{id}_#{size}.png"
    html = "<img src='#{url}' width='#{size}' height='#{size}' alt='#{id_to_name(id)}' />"
    return html.html_safe
  end
end
