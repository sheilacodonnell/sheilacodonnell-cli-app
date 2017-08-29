# object
#   class
#     -@@all - all objects in this class
#     -@@doc - all the data needed to create object in this class
#     book_1 = Book.new
#       - @name = "Harry Potter"

require 'pry'
class Bestsellers
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

 def self.book_data
  @@book_data ||= doc.search(".title").collect{|e| e.text}
end

def self.authors
   @@authors ||= doc.search(".author").collect{|e| e.text}
end

def self.durations
  @@durations ||= doc.search(".freshness").collect{|e| e.text}
end

def self.descriptions
  @@descriptions ||= doc.search(".description").collect{|e| e.text}
end




def self.doc
  @@doc ||= Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))
end


  def self.scrape_all

    (0..book_data.size).to_a.each do |i|
      title = book_data[i]
      author = authors[i]
      duration = durations[i]
      description = descriptions[i]

     book = Bestsellers.new
     book.title =  title
     book.author =  author
     book.duration =  duration
     book.description = description
     book.save
end
end
end
