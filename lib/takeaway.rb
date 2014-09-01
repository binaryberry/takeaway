class Takeaway

MENU = { burrito: 7, salad: 9, banana: 2, cola: 2}
	
	attr_accessor	:order, :dish, :order_more

	def initialize
	order = {}
	@order = order
	@order_more = "yes"
	end

	def price(dish)
	MENU[dish].to_i
	end

	def show_menu
	MENU.each {|dish, price| puts "#{dish.capitalize}: £#{price}"}
	end

	def take_order
	show_menu
		until order_more == "no" do
		puts "Which dish would you like to order?"
		dish = gets.chomp.to_sym
		puts "How many #{dish}s would you like?"
		quantity = gets.chomp.to_i
		@order[dish] = quantity
		puts "Would you like anything else?"
		@order_more = gets.chomp.downcase
		end
	@order.each { |dish, quantity| puts "#{quantity.to_s} #{dish.to_s}"}
	end

	def order_total
		total = 0
		@order.each do |dish,quantity|
		total += price(dish) * quantity
		end
		total
	end

end