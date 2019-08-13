class AddTemplateIdToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :client_template_id, :integer
  end
end
