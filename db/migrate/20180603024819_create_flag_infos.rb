class CreateFlagInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :flag_infos do |t|
      t.integer :flag_id
      t.string :flag_name

      t.timestamps
    end
  end
end
