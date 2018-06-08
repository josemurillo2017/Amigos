class TestingController < ApplicationController
  def test1
    @user = MemberInfo.new
  end
end
