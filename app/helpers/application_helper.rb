module ApplicationHelper

    def resource_name
      :user
    end

    def resource
        @resource ||= User.new
    end

    def resource_class
        User
    end

    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end


  def img430(g,big)
    case big
    when 1
      if g.image.present?
        return g.image.medium.url
      elsif g.http_image.nil?
        return "http://placehold.it/200x200&text=No Pic"
      else
        return g.http_image + "_430x430q90.jpg"
      end
    when 2
      if g.image2.present?
        return g.image2.medium.url
      elsif g.http_image2.nil?
        return "http://placehold.it/200x200&text=No Pic"
      else
        return g.http_image2 + "_430x430q90.jpg"
      end
    when 3
      if g.image3.present?
        return g.image3.medium.url
      elsif g.http_image3.nil?
        return "http://placehold.it/200x200&text=No Pic"
      else
        return g.http_image3 + "_430x430q90.jpg"
      end
    when 4
      if g.image4.present?
        return g.image4.medium.url
      elsif g.http_image4.nil?
        return "http://placehold.it/200x200&text=No Pic"
      else
        return g.http_image4 + "_430x430q90.jpg"
      end
    when 5
      if g.image5.present?
        return g.image5.medium.url
      elsif g.http_image5.nil?
        return "http://placehold.it/200x200&text=No Pic"
      else
        return g.http_image5 + "_430x430q90.jpg"
      end
    end
  end

  def imgmax(g,big)
    case big
    when 1
      if g.image.present?
        return g.image.url
      elsif g.http_image.nil?
        return "http://placehold.it/200x200&text=No Pic"
      else
        return g.http_image
      end
    when 2
      if g.image2.present?
        return g.image2..url
      elsif g.http_image2.nil?
        return "http://placehold.it/200x200&text=No Pic"
      else
        return g.http_image2
      end
    when 3
      if g.image3.present?
        return g.image3.url
      elsif g.http_image3.nil?
        return "http://placehold.it/200x200&text=No Pic"
      else
        return g.http_image3
      end
    when 4
      if g.image4.present?
        return g.image4.url
      elsif g.http_image4.nil?
        return "http://placehold.it/200x200&text=No Pic"
      else
        return g.http_image4
      end
    when 5
      if g.image5.present?
        return g.image5.url
      elsif g.http_image5.nil?
        return "http://placehold.it/200x200&text=No Pic"
      else
        return g.http_image5
      end
    end
  end
end
