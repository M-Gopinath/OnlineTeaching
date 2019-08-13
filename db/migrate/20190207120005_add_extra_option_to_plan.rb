class AddExtraOptionToPlan < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :duration_type, :string
    add_column :plans, :storage_limit, :float
  end
end
