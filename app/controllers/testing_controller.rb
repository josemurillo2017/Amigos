class TestingController < ApplicationController
  def test1
    @user = MemberInfo.find(1)
  end
end
