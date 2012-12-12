module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def type_icon(id,size)
    url = "http://image.eveonline.com/InventoryType/#{id}_#{size}.png"
    html = "<img src='#{url}' width='#{size}' height='#{size}' />"
    return html.html_safe
  end

  def character_portrait(id,size)
    url = "http://image.eveonline.com/Character/#{id}_#{size}.jpg"
    html = "<img src='#{url}' width='#{size}' height='#{size}' />"
    return html.html_safe
  end

  def corp_logo(id,size)
    url = "http://image.eveonline.com/Corporation/#{id}_#{size}.png"
    html = "<img src='#{url}' width='#{size}' height='#{size}' />"
    return html.html_safe
  end

  def alliance_logo(id,size)
    url = "http://image.eveonline.com/Alliance/#{id}_#{size}.png"
    html = "<img src='#{url}' width='#{size}' height='#{size}' />"
    return html.html_safe
  end
end
