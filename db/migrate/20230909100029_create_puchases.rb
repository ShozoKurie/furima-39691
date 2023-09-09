class CreatePuchases < ActiveRecord::Migration[7.0]
  def change
    create_table :puchases do |t|

      t.timestamps
    end
  end
end
