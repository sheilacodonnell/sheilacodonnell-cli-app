class Books::Bestsellers
  attr_accessor :name, :author, :price, :url, :description

  def self.today
  # Scrape goodreads and return books based on data
  self.scrape_books
end

  def self.scrape_books
    deals = []

    deals << self.scrape_goodreads
    #go to goodreads
    #find the books
    #extract the properties
    #instantiate a books

    # bestseller_1 = self.new
    # bestseller_1.name = "Six of Crows (Six of Crows, #1)"
    # bestseller_1.author = "Leigh Bardugo"
    # bestseller_1.price = "$2.99"
    # bestseller_1.url = "http://goodreads.com"
    # bestseller_1.description = "From the New York Times and USA Today-bestselling author of the Grisha Trilogy. Criminal prodigy Kaz Brekker has been offered wealth beyond his wildest dreams. But to claim it, he'll have to pull off a seemingly impossible heist and a crew desperate enough and dangerous enough to get the job done."
    #
    # bestseller_2 = self.new
    # bestseller_2.name = "Loving Frank"
    # bestseller_2.author = "Nancy Horan"
    # bestseller_2.price = "$2.99"
    # bestseller_2.description = "Mamah Borthwick Cheney struggles to justify her clandestine love affair with Frank Lloyd Wright. Four years earlier, in 1903, Mamah and her husband had commissioned the renowned architect to design a new home for them. During the construction of the house, a powerful attraction developed between Mamah and Frank, and in time the lovers embarked on a course that would shock Chicago society and forever change their lives."

    #at the end return this array
    deals
  end

    def self.scrape_goodreads
      doc = Nokogiri::HTML(open("https://www.goodreads.com"))
      binding.pry
    end
end
