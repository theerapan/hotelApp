class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :room_number
      t.references :employee, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
