# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :phone, null: false, index: { unique: true }
      t.string :name

      t.timestamps
    end
  end
end
