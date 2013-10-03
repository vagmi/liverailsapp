class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :tags, :array=>true
      t.reference :user_id
      t.timestamps
    end
  end
end
