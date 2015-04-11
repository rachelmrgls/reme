class AddActivationToClients < ActiveRecord::Migration
  def change
    add_column :clients, :activation_digest, :string
    add_column :clients, :activated, :boolean, default: false
    add_column :clients, :activated_at, :datetime
  end
end
