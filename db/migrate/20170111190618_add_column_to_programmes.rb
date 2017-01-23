class AddColumnToProgrammes < ActiveRecord::Migration[5.0]
  def change
    add_column :programmes, :customer_id, :integer
  end
end
