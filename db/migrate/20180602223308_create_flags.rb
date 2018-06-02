class CreateFlags < ActiveRecord::Migration[5.1]
  def change
    create_table :flags do |t|
      t.integer :flag_id
      t.integer :member_id
      t.boolean :solution_in_process

      t.timestamps
    end
  end
end
