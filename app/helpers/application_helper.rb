module ApplicationHelper
  def is_active controller
    params[:controller] == controller ? "active" : ""
  end

  def calc_money quantity, unit_price
    quantity = 0 unless quantity.present?
    unit_price = 0 unless unit_price.present?
    quantity * unit_price
  end

  def display_unit device
    case device.unit
    when "cai"
      t "unit.cai"
    when "bo"
      t "unit.bo"
    else
      ""
    end
  end

  def default_format_number number
    number_with_delimiter number, delimiter: ".", separator: ","
  end
end
