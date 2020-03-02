# p "RUNNING SEED FILE"
require 'net/http'
# puts Book.all

# Delete all books in db, useful if we're gonna run tthis file a lot
Book.destroy_all

# WORKING WITH APIS
# 1) Do I know where the data lives and the type of URL to access it?
# 2) Can I get that same response via ruby?
# 3) Can I format the response into a Ruby object that I like for the work?
# 4) Can I iterate through formatted response to save objects to db?

url_string = "https://www.googleapis.com/books/v1/volumes?q=intitle:book&maxResults=40&startIndex=11"

uri = URI(url_string)

response = Net::HTTP.get(uri)

response_hash = JSON.parse(response)

response_hash["items"].each do |item|
  new_title = item["volumeInfo"]["title"]
  new_description = item["volumeInfo"]["subtitle"]
  if item["volumeInfo"]["authors"]
    new_authors = item["volumeInfo"]["authors"].join(", ")
  end
  if item["volumeInfo"]["categories"]
    new_categories = item["volumeInfo"]["categories"].join(", ")
  end
  p Book.create(title: new_title, description: new_description, authors: new_authors, categories: new_categories)
end

binding.pry