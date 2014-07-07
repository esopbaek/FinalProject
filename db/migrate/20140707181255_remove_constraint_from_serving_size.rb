class RemoveConstraintFromServingSize < ActiveRecord::Migration
  def change
    change_column :foods, :serving_size, :string, null: true
  end
end
