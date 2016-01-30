class CreateValidations < ActiveRecord::Migration
  def change
    create_table :validations do |t|
      t.string :tag_id
      t.string :encoded_id

      t.timestamps
    end
  end
end
