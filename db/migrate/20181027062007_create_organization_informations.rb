class CreateOrganizationInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_informations do |t|
      t.string :name
      t.text :description
      t.string :landing_page_image
      t.string :logo

      t.timestamps
    end
  end
end
