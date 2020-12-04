user = User.create(email: "nicklevenson@gmail.com", username: "nick", password_digest: "circle")

recipe = Recipe.create(name: "pasta")

Cuisine.create({name: "Italian"}).recipes << recipe

recipe.ingredients << Ingredient.create({name: "noodles", amount: 1, unit_type: "Cup"})

recipe.steps << Step.create({action: "Make the spaget"})