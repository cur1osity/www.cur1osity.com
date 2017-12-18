class AddApiTokenToUsers < ActiveRecord::Migration[5.0]
  def change
	
	add_column :users, :token_digest, :string
    add_column :users, :token_sent_at, :datetime

  end
end
