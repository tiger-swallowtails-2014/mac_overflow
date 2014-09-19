class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voteable_id
      t.string :voteable_type
      t.integer :count, default: 0
      t.belongs_to :voteable
      t.timestamps
    end
  end
end
