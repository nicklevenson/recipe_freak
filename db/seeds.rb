user = User.create(email: "nicklevenson@gmail.com", username: "nick", password: "circle")

recipe = Recipe.create(name: "pasta", cook_time: "4 mins", serving_size: 6, public?:false)
user.recipes << recipe
Cuisine.create({name: "Italian"}).recipes << recipe
recipe.cook_time = "3 mins"
recipe.ingredients << Ingredient.create({name: "noodles", amount: 1, unit_type: "Cup"})
recipe.steps << Step.create({action: "Make the spaget"})

20.times do
  user1 = User.create(email: Faker::Internet.unique.email , username:  Faker::Name.unique.name , password: Faker::Color.unique.hex_color)
  recipe1 = Recipe.create(name: Faker::Food.dish, cook_time: "#{rand(50)} minutes", serving_size: rand(10), public?:true)
  user1.recipes << recipe1
  Cuisine.create({name: Faker::Restaurant.type}).recipes << recipe1
  3.times do
  recipe1.ingredients << Ingredient.create({name: Faker::Food.ingredient, amount: rand(10), unit_type: Faker::Food.metric_measurement})
  recipe1.steps << Step.create({action: "Do the thing"})
  end
end