class CreatePlanBenefits < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_benefits do |t|
      t.references :plan, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
