class AddResetToClients < ActiveRecord::Migration
  def change
    add_column :clients, :reset_digest, :string
    add_column :clients, :reset_sent_at, :datetime
  end
end
