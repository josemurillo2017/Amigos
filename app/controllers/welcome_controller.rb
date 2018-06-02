class WelcomeController < ApplicationController
  def index
    members_id = 1
    @member= MemberInfo.find(members_id)
  end

  def missing_sat_score

  end
end
