class AddPriceCentsToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :price_cents, :integer, null: false, default: 0
    add_column :purchases, :amount_cents, :integer, null: false, default: 0
  end
end
