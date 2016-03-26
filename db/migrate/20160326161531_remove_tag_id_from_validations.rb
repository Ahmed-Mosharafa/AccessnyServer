class RemoveTagIdFromValidations < ActiveRecord::Migration
  def change
    remove_column :validations, :tag_id
  end
end
