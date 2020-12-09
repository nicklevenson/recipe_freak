class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  def step_change(new_amount)
    ratio = new_amount / self.recipe.serving_size.to_f
    self.amount * ratio
  end
end
