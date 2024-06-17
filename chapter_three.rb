class BookInStock

    attr_accessor :price
    attr_reader :isbn

    def initialize(isbn, price)
        @isbn = isbn
        @price = Float(price)
    end

    def to_s
        "ISBN: #{@isbn}, price: #{@price}"
    end

    def price_in_cents
        (price * 100).round
    end

    #def price_in_cents=(cents)
    #    @price = cents / 100.0
    #end

    #def isbn
    #    @isbn
    #end

    #def price
    #    @price
    #end
    #def price=(new_price)
    #    @price = new_price
    #end
end

b1 = BookInStock.new("isbn1",3)
p b1
b2 = BookInStock.new("isbn2", 3.14)
p b2
b3 = BookInStock.new("isbn3", "5.67")
p b3
puts b1

b4 = BookInStock.new("isbn4", 12.34)
puts "ISBN = #{b4.isbn}"
puts "Price = #{b4.price}"

b4.price = b4.price * 0.75
puts "New price of b4 = #{b4.price}"
puts "Price of b4 in cents: #{b4.price_in_cents}"
b4.price = 1234
puts "New price of b4 = #{b4.price}"
puts "Price of b4 in cents: #{b4.price_in_cents}"

class CsvReader
    def initialize
        @books_in_stock = []
    end

    def read_in_csv_data(csv_file_name)
        CSV.foreach(csv_file_name, headers: true) do |row|
            @books_in_stock << BooksInStock.new(row["ISBN"], row["Price"])
        end
    end

    def total_value_in_stock
    end

    def number_of_each_isbn
    end
end

