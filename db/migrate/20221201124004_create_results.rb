class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.integer :in
      t.text :out

      t.timestamps
    end
    add_index :results, :in, unique: true
  end
end
