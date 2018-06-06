class WelcomeController < ApplicationController
  def index
    members_id = 1
    @member= MemberInfo.find(members_id)
    risk_function(members_id)
    @flags = Flag.where(member_id = members_id.to_s)
  end

  def risk_function(member_id)
    @member = MemberInfo.find(member_id)

    #Listing all the risks
    missing_sat = [@member.grade > 11 & @member.sat_score = 0, 1] # Does not have an SAT score even though in 12th grade
    # puts "Missing SAT is "+ missing_sat[0].to_s

    low_grades  = [@member.gpa < 2,2] #GPA is below a 2.0
    # puts "Low grades is "+low_grades[0].to_s
    #Combines all the risks into an array
    risk_list = [missing_sat, low_grades]

    #Checks each risk for the individual
    risk_list.each do |i|
      # puts "Launching risk function"
      risk(i[0], i[1])
    end

  end

  def risk(risk_boolean, risk_id)
    #Checks if there is a flag
    current_flag = Flag.where({member_id: @member.id.to_s , flag_id: risk_id.to_s})
    flag_exists = !current_flag.empty?
    # puts "Checking if flag_exists"
    # puts " The flag exists is " + flag_exists.to_s + "for id " + risk_id.to_s

    if risk_boolean and !flag_exists
      #There is a risk and it has not been recorded
      # puts "There is a risk and it has not been recorded"
      # puts "Creating a new flag"
      new_flag = Flag.new
      new_flag.flag_id = risk_id
      new_flag.member_id = @member.id
      new_flag.solution_in_process = FALSE
      new_flag.save
    elsif !risk_boolean and flag_exists

      #There is no risk so we need to delete the flag
       # puts "There is no risk so we need to delete the flag"
      current_flag.destroy_all
    end
  end



end
