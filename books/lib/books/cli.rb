#Our CLI Controller

class Books::CLI

  def call
    Bestsellers.scrape_all
    list_books
    menu
    # goodbye

  end

  def list_books
    puts "The bestselling books right now."
      Bestsellers.all.each.with_index(1) do |book, i|  #chain with index and give it 1 so you start with 1
     puts "#{i}. #{book.title}" #creating the list of books
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
      elsif input == "exit"
        puts "Bye!!"


      elsif input.to_i > 0

        book = Bestsellers.find(input)
        puts     "#{book.title}"
        puts     "#{book.author}"
        puts     "#{book.description}"
        puts     "#{book.duration}"

      # else
      #   puts "Hmm, not sure what you want. Type list or exit."

    end
  end
end

# def goodbye
#   "Bye!!"
# end

end
