class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :comments, :contect, :content
  end
end
