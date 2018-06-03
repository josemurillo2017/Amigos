class WelcomeController < ApplicationController
  def index
    members_id = 1
    @member= MemberInfo.find(members_id)
    risk_function(members_id)
  end

  def risk_function(member_id)
    @member = MemberInfo.find(member_id)

    #Listing all the risks
    missing_sat = [@member.grade > 11 && @member.sat = 0, 1]
    low_grades  = [@member.gpa < 3,2]

    #Combines all the risks into an array
    risk_list = [missing_sat, low_grades]

    #Checks each risk for the individual
    risk_list.each do |i|
      risk(i[0], i[1])
    end

  end

  def risk(risk_boolean, risk_id)
    #Checks if there is a flag
    current_flag = Flag.where(member_id = @member.id.to_s && flag_id =risk_id.to_s)
    flag_exists = !current_flag.empty?
    puts "Checking if flag_exists"


    if risk_boolean and !flag_exists
      #There is a risk and it has not been recorded
      puts "There is a risk and it has not been recorded"
      new_flag = flag.new
      new_flag.flag_id = risk_id
      new_flag.member_id = @member.id
      new_flag.in_progress = FALSE
      new_flag.save
    elsif !risk_boolean and flag_exists
      #There is no risk so we need to delete the flag
      puts "There is no risk so we need to delete the flag"
      #current_flag.delete
    end
  end



end
