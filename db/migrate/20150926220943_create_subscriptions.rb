class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
    	t.string :email
      t.timestamps null: false
    end
  end
end
