class ChangeColumnNameInBooks < ActiveRecord::Migration[6.1]
  def up
    rename_column :books, :opinion, :body
  end

  def down
    rename_column :books, :body, :opinion
  end
end
