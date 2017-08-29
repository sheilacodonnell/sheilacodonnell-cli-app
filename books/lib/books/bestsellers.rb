# object
#   class
#     -@@all - all objects in this class
#     -@@doc - all the data needed to create object in this class
#     book_1 = Book.new
#       - @name = "Harry Potter"

require 'pry'
class Books::Bestsellers
  attr_accessor :title, :author, :description, :duration
  @@all = []

 def self.all
   @@all
 end

 def save
   @@all << self
 end

 def self.find(id)
   self.all[id.to_i - 1]
 end

  def self.scrape_all

    page = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
    page.encoding = 'utf-8'
    page.css(".book-body").each do |b|
      
      book = Books::Bestsellers.new
      book.title = b.css("h3.title").text.split.map {|t| t.capitalize}.join(" ")
      book.author = b.css(".author").text
      book.description = b.css(".description").text.strip
      book.duration = b.css(".freshness").text
      book.save
    end
  end

end
