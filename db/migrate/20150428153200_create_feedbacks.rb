class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :appearance
      t.text :experience
      t.text :organization
      t.text :overall
      t.integer :score
      t.integer :status
      t.string :resume
      t.references :user, index: true, foreign_key: true
      #t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :feedbacks, [:user_id, :created_at]
    #add_index :feedbacks, [:reviewer_id, :created_at]
  end
end
