module ApplicationHelper
  def title(str=nil)
    str or "MarketPlace"
  end

  def render_notice &block
    if notice
      capture block.call
    end
  end

  def render_alert &block
    if alert
      capture block.call
    end
  end
end
