class AddResumeToClients < ActiveRecord::Migration
  def change
    add_column :clients, :resume, :string
  end
end
