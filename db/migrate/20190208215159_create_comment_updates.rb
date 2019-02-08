class CreateCommentUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_updates do |t|
      t.integer :comment_id
      t.datetime :update_date
      t.datetime :update_time
      t.string :update_type
      t.string :current_update
      t.string :employee_name
      t.integer :user_id
      t.timestamps
    end
  end
end
