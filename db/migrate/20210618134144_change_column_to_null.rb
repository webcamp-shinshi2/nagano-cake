class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :products, :image_id, true
  end

  def down
    change_column_null :products, :image_id, false
  end
end
