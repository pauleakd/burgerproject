require_relative('burger')
require_relative('eatery')
require_relative('deal')

class DealXforY < Deal
  attr_reader :name, :id
  attr_accessor :menu_item_id

  def save()
    sql = "INSERT INTO deals_x_for_y (name, menu_item_id, day_id, amount)
    VALUES ('#{@name}', #{@menu_item_id}, #{@day_id}, #{@amount})
    RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM deals_x_for_y"
    result = SqlRunner.run(sql)
    deals = result.map{|deal| DealXforY.new(deal)}
    return deals
  end

  def self.delete_all()
    sql = "DELETE FROM deals_x_for_y"
    SqlRunner.run(sql)
  end

  def calculate_savings()
    
  end

  # def burger()
  #   sql = "SELECT burgers.* FROM burgers INNER JOIN menu_items
  #    ON menu_items.burger_id = burgers.id WHERE
  #    menu_items.id = #{@menu_item_id} "
  #    result = SqlRunner.run(sql).first
  #    burger = Burger.new(result)
  #    return burger
  # end

  # def eatery()
  #   sql = "SELECT eateries.* FROM eateries INNER JOIN menu_items
  #    ON menu_items.eatery_id = eateries.id WHERE
  #    menu_items.id = #{@menu_item_id} "
  #    result = SqlRunner.run(sql).first
  #   eatery = Eatery.new(result)
  #    return eatery
  # end

  # def day()
  #   sql = "SELECT days.name FROM days WHERE id = #{@day_id}"
  #   result = SqlRunner.run(sql).first
  #   day = Day.new(result)
  #   return day
  # end
end