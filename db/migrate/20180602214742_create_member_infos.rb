class CreateMemberInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :member_infos do |t|
      t.string :first_name
      t.string :last_name
      t.integer :sat_score
      t.integer :act_score
      t.float :gpa
      t.integer :grade

      t.timestamps
    end
  end
end
