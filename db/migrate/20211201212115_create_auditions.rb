class CreateAuditions < ActiveRecord::Migration[5.2]
  def change
    create_table :auditions do |given|
      given.string :actor
      given.string :location
      given.integer :phone
      given.boolean :hired
      given.integer :role_id
    end
  end
end
