class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  def step_change(new_amount)
    ratio = self.recipe.serving_size.to_f / new_amount
    self.amount * ratio
  end
end
