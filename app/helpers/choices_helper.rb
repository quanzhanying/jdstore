module ChoicesHelper
  def render_aa1_status(choice)
    if choice.is_aa1en
      content_tag(:span, "", :class => "fa fa-check btn btn-xs btn-success")
    else
      content_tag(:span, "", :class => "fa fa-square-o btn btn-xs btn-warning")
    end
  end


  def render_bb1_status(choice)
    if choice.is_bb1en
      content_tag(:span, "", :class => "fa fa-check btn btn-xs btn-success")
    else
      content_tag(:span, "", :class => "fa fa-square-o btn btn-xs btn-warning")
    end
  end

  def render_cc1_status(choice)
    if choice.is_cc1en
      content_tag(:span, "", :class => "fa fa-check  btn btn-xs btn-success")
    else
      content_tag(:span, "", :class => "fa fa-square-o btn btn-xs btn-warning")
    end
  end

  def render_dd1_status(choice)
    if choice.is_dd1en
      content_tag(:span, "", :class => "fa fa-check  btn btn-xs btn-success")
    else
      content_tag(:span, "", :class => "fa fa-square-o btn btn-xs btn-warning")
    end
  end



  def render_ee1_status(choice)
    if choice.is_ee1en
      content_tag(:span, "", :class => "fa fa-check btn btn-xs btn-success")
    else
      content_tag(:span, "", :class => "fa fa-square-o btn btn-xs btn-warning")
    end
  end

  def render_ff1_status(choice)
    if choice.is_ff1en
      content_tag(:span, "", :class => "fa fa-check btn btn-xs btn-success")
    else
      content_tag(:span, "", :class => "fa fa-square-o btn btn-xs btn-warning")
    end
  end


end
