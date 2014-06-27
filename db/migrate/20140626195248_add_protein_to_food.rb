class AddProteinToFood < ActiveRecord::Migration
  def change
    add_column :foods, :protein, :integer, :default => 0
    add_column :foods, :sugar, :integer, :default => 0
  end
end
