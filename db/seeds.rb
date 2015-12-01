require 'faker'

# USER
50.times do
  User.create(email: Faker::Internet.email, username: Faker::Internet.user_name, password: "test")
end


# TYPE
Type.create(name: "bag", category: "Accessories")
Type.create(name: "dress", category: "Clothing")
Type.create(name: "jacket", category: "Accessories")
Type.create(name: "jewelry", category: "Accessories")
Type.create(name: "pants", category: "Clothing")
Type.create(name: "dress", category: "Clothing")
Type.create(name: "scarf", category: "Accessories")
Type.create(name: "shirt", category: "Clothing")
Type.create(name: "shoe", category: "Shoes")
Type.create(name: "skirt", category: "Clothing")
Type.create(name: "sunglasses", category: "Accessories")
Type.create(name: "sweater", category: "Clothing")

# ITEM
# generate array of image names
item_types_names = %w(bag dress jacket jewelry pants scarf shirt shoe skirt sunglasses sweater)

all_images = Array.new
item_types_names.each_with_index do |item, index|
  type = item_types_names[index]
  10.times do |i|
    all_images << "#{type}#{i+1}.jpg"
    i += 1
  end
end

#generate an array that simply has all the types for each one the 110 items that will be created, so that we can use this array repeatedly to make tags make sense for what type of item it is
type_array = (item_types_names*10).sort


# create items
type_array_copy = type_array.dup

# 110.times do
#   Item.create(user_id: rand(1..50), photo: "img/#{all_images.pop}", description: "#{type_array_copy.pop}: so awesome much fun very meme so puppy many cutes so awesome much fun very meme so puppy many cutes so awesome much fun very meme so puppy many cutes so awesome much fun very meme so puppy many cutes")
# end

size_array = [0, 2, 4, 6, 8, 10, 12, 14]
brand_array = %w(Gucci Prada Nike Adidas Kardashian Quiksilver Joie DKNY Armani Shrimps Shoshanna Juicy)

11.times do |i|
	10.times do
		current_image = all_images.pop
		current_type = type_array_copy.pop
		current_item = Item.create(
			user_id: rand(1..50), 
			photo: "img/#{current_image}", 
			description: "#{current_type}: so awesome much fun very meme so puppy many cutes so awesome much fun very meme so puppy many cutes so awesome much fun very meme so puppy many cutes so awesome much fun very meme so puppy many cutes",
			rating: rand(1..10),
			size: size_array.sample,
			brand: brand_array.sample
			)
		# binding.pry
		ItemType.create(
			item: current_item,
			type_id: i+1)
	end
	i += 1
end


# LIKE
# I can't make any duplicate likes, because no user is allowed to like the same thing twice.
# to accomplish this without over complicating things, lets just limit the number of likes per item to one for now. That way no one user can like the same thing twice because no thing is getting liked twice anyways.
# we will let each user have on average 2 likes by creating 100 likes.
# so lets create an array of numbers 1 through 110 in a random order that we can pop from when we are creating likes.

one_ten = *(1..110)
randomized_one_ten = one_ten.shuffle

100.times do
  Like.create(user_id: rand(1..50), item_id: randomized_one_ten.pop)
end



# TAG
one_ten_copy = one_ten.dup
type_array_copy = type_array.dup

#create tags so there is one tag for each item
# 110.times do
#   Tag.create(tag: "#{type_array_copy.pop}")
# end

Tag.create(name: "mod")
Tag.create(name: "vintage")
Tag.create(name: "flattering")
Tag.create(name: "beautiful")
Tag.create(name: "vintage")
Tag.create(name: "kanye-approved")



# ITEM_TAG
# create an array of tags such that the tags will match the pictures, so we can use this array in creating tag objects
one_ten_copy = one_ten.dup
one_ten_copy2 = one_ten.dup
type_array_copy = type_array.dup
110.times do
  ItemTag.create(item_id: one_ten_copy.pop, tag_id: one_ten_copy2.pop)
end



#create relationships for the extra tags. to assign them randomly to items
180.times do
  ItemTag.create(item_id: rand(1..110), tag_id: rand(111..290))
end
