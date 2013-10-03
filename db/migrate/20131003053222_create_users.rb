class CreateUsers < ActiveRecord::Migration
  def change
    enable_extension :hstore
    create_table :users do |t|
      t.string :fb_id
      t.string :name
      t.string :email
      t.hstore :provider_properties

      t.timestamps
    end
  end
end
