class CashRegister
    attr_accessor :discount, :items, :previous_total
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @previous_total = 0
    end

    def add_item(title, price, qty = 1)
        @previous_total = @total
        sub_total = price * qty
        @total += sub_total
        qty.times do @items << title end
    end
    
    def total=(new_total)
        @total = new_total.to_f
    end

    def total
        @total.to_f
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            discount = @discount.to_f / 100.0
            total = @total.to_f * (1 - discount)
            @total = total.to_f.ceil(2)
            "After the discount, the total comes to $#{total.to_i}."
        end
    end

    def void_last_transaction
        @total = @previous_total.to_f.ceil(2)
    end
end