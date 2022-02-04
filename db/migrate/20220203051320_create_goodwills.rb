class CreateGoodwills < ActiveRecord::Migration[6.0]
  def change
    create_table :goodwills do |t|
      t.references :user, null: false, foreign_key: true
      t.references :like, null: false, foreign_key: { to_table: :memos }

      t.timestamps
    end
  end
end
