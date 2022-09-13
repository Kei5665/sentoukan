class AddColumnEarnedMoneyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :earned_money, :integer, default: 0
  end
end
