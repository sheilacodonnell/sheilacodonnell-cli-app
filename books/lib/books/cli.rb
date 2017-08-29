#Our CLI Controller
require 'pry'

class Books::CLI

  def call
    Books::Bestsellers.scrape_all
    list_books
    menu
  end

  def list_books
    puts "The bestselling books right now."
      Books::Bestsellers.all.each.with_index(1) do |book, i|  #chain with index and give it 1 so you start with 1
     puts "#{i}. #{book.title}"
      #creating the list of books
  end
  puts ""
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
      elsif input.to_i.between?(0, Books::Bestsellers.all.size)

        book = Books::Bestsellers.find(input)
        puts     "#{book.title}"
        puts     "#{book.author}"
        puts     "#{book.description}"
        puts     "#{book.duration}"

      end
    end
  end

end
