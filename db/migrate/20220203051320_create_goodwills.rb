class CreateGoodwills < ActiveRecord::Migration[6.0]
  def change
    create_table :goodwills do |t|
      t.references :user, null: false, foreign_key: true
      t.references :memo, null: false

      t.timestamps
    end
  end
end
