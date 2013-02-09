module ApplicationHelper
  def resource_name
    :pro
  end

  def resource
    @resource ||= Pro.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:pro]
  end
end
