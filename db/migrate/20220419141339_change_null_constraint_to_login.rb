class ChangeNullConstraintToLogin < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :login, true
    change_column_default :users, :login, nil
  end
end
