module ApplicationHelper
  def is_active controller
    params[:controller] == controller ? "active" : ""
  end

  def calc_money quantity, unit_price
    quantity = 0 unless quantity.present?
    unit_price = 0 unless unit_price.present?
    quantity * unit_price
  end
end
