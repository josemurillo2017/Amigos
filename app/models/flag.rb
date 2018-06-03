class Flag < ApplicationRecord
  belongs_to :flag_info, foreign_key: "flag_id"
end
