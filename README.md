# FoodJunkie

```ruby
recipe = FoodJunkie::Recipe.new <<-END_RECIPE
  Mix 2 cups of all-purpose flour and 3/4 teaspoon of salt together until
  blended. Make a well in the flour, add the 3/4 cup of milk, and whisk until
  consistent. Beat 3 eggs into the batter. Add 3/4 cup of water and beat again
  until the mixture is light and frothy. Set aside for an hour (or, if it's the
  day before, cover in the fridge overnight).
  
  If the batter has been refrigerated, allow it to come up to room temperature
  before using. When the roast beef is ready to come out of the oven, ready the
  mixture.
  
  Preheat oven to 400 degrees F.
  
  Pour off 1/2 cup of roast beef drippings into a 9x12 inch baking dish and
  place into the oven until the drippings sizzle. Pour the batter over the
  drippings and bake for 30 minutes (or until the sides have risen and are
  golden brown). Cut into eight portions and serve immediately.
END_RECIPE

# Break out into steps
recipe.steps
 #=> [...]

# List all the ingredients used in the recipe
recipe.ingredients
 #=> [...]

# How long the recipe will take to complete
recipe.total_time
```