#Our CLI Controller

class Books::CLI

  def call
    Bestsellers.scrape_all
    list_books
    menu

  end

  def list_books
    puts "The bestselling books right now."

    # @books = Bestsellers.this_week #if you return Bestseller objects, it'll work
    # @books.each.with_index(1) do |book, i| #chain with index and give it 1 so you start with 1
    #   puts "#{i}. #{book.name} " #creating the list of books
      Bestsellers.all.each.with_index(1) do |book, i|
     puts "#{i}. #{book.title}"
  end
end


  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the book you'd like more info on, or type exit."
      input = gets.strip.downcase
      #how to deal with users input
      if input == "list"
        list_books
        # puts "#{the_book.name} - #{the_book.author} - #{the_book.description} - #{the_book.duration}"
      elsif input == "exit"
         puts "Goodbye!"

      elsif input.to_i > 0

        book = Bestsellers.find(input)
        puts "#{book.title}"
        puts "   #{book.author}"
        puts "   #{book.description}"
        puts "   #{book.duration}"
      else input.to_i > Bestsellers.all.size
        puts "Hmm, not sure what you want. Type list or exit."
    end
  end
end

end
