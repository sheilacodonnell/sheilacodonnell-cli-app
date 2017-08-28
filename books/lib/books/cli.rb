#Our CLI Controller

class Books::CLI

  def call
    list_books
    menu
    goodbye
  end

  def list_books
    puts "The bestselling books."
    # puts <<-DOC
    # 1. Six of Crows (Six of Crows, #1)
    # 2. Loving Frank
    # 3. The Perfect Game (The Perfect Game, #1)
    # DOC
  # end
    @books = Books::Bestsellers.today #if you return Bestseller objects, it'll work
    @books.each.with_index(1) do |book, i| #chain with index and give it 1 so you start with 1
      puts "#{i}. #{book.name} - #{book.author}" #creating the list of books
  end
end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the book you'd like more info on, or type exit."
      input = gets.strip.downcase
      #how to deal with users input
      if input.to_i > 0
        the_book = @books[input.to_i-1] #we want array index of the book
        puts "#{the_book.name} - #{the_book.author} - #{the_book.description} - #{the_book.duration}"
      elsif input == "list"
        list_books
      else
        puts "Hmm, not sure what you want. Type list or exit."
    end
  end

end

  def goodbye
    puts "See you later!"
  end
end
