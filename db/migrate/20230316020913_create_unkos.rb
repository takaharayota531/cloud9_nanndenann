class CreateUnkos < ActiveRecord::Migration[7.0]
  def change
    create_table :unkos do |t|
      t.string :shine
      t.string :kimoi

      t.timestamps
    end
  end
end
