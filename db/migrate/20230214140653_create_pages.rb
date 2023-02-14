class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :phone, null: false, index: {unique: true }
      t.string :name

      t.timestamps
    end
  end
end
