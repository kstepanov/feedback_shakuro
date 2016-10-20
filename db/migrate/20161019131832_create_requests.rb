class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :admin_user, foreign_key: true
      t.string :project_name
      t.string :feature_name
      t.string :customer_name
      t.string :customer_email
      t.string :uid

      t.timestamps
    end
  end
end
