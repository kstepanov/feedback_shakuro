class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.references :request, foreign_key: true

      t.string :project_name
      t.string :feature_name
      t.string :customer_name
      t.string :customer_email

      t.integer :rate
      t.text :details

      t.timestamps
    end
  end
end
