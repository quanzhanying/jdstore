module ApplicationHelper

  def render_create_time(o)
    render_date_time(o.created_at.localtime)
  end

  def render_update_time(o)
    render_date_time(o.created_at.localtime)
  end

  def render_date_time(time)
    time.strftime('%H:%M:%S %m/%d %Y' )
  end

  def render_text(text, length: length)
    if length.nil?
      text
    else
      text[0,length] + '...'
    end
  end

  def render_price(price)
    sprintf("%2.2f", price)
  end
end
