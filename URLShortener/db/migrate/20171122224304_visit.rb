class Visit < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |v|
      v.integer :user_id, null: false
      v.string :short_url, null: false
    end
  end

end
