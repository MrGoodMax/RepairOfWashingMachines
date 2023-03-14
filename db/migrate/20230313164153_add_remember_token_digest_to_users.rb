# frozen_string_literal: true

class AddRememberTokenDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remember_token_digest, :string
  end
end
