require "price"

module RentalApp
  class Movie
    REGULAR = 0
    NEW_RELEASE = 1
    CHILDRENS = 2

    attr_reader :title, :price_code

    def initialize(title, price_code)
      @title, self.price_code = title, price_code
    end

    def charge(days_rented)
      @price.charge(days_rented)
    end

    def frequent_renter_points(days_rented)
      (price_code == Movie::NEW_RELEASE && days_rented > 1) ? 2 : 1
    end

    def price_code=(value)
      @price_code = value
      @price = case price_code
        when REGULAR then RegularPrice.new
        when NEW_RELEASE then NewReleasePrice.new
        when CHILDRENS then ChildrensPrice.new
      end
    end
  end
end

