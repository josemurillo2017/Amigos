class RemoveFlagIdFromFlagInfo < ActiveRecord::Migration[5.1]
  def change
    remove_column :flag_infos, :flag_id, :integer
  end
end
