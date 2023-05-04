class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.text :body, null: false

      t.timestamps
    end
  end
end
