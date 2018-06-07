class WelcomeController < ApplicationController
  def index

    members_id = 1 #I will need to eventually replace this with the id of the person I am interested in

    @member= MemberInfo.find(members_id)
    risk_function(members_id) #I might have to eventually remove this from here because it would be too time consuming to run this every time. The best solution would be to run this update only when there is a change to a person's information.
    @flags = Flag.where(member_id = members_id.to_s)

  end

  def risk_function(member_id)
    @member = MemberInfo.find(member_id)

    #Listing all the risks
    missing_sat = [@member.grade > 11 & @member.sat_score = 0, 1] # Does not have an SAT score even though in 12th grade
<<<<<<< HEAD
=======

>>>>>>> parent of bb26147... Fixed issue with flags not displaying
    low_grades  = [@member.gpa < 2,2] #GPA is below a 2.0

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
<<<<<<< HEAD

    if risk_boolean and !flag_exists
      #There is a risk and it has not been recorded
=======
    # puts "Checking if flag_exists"


    if risk_boolean and !flag_exists
      #There is a risk and it has not been recorded
      # puts "There is a risk and it has not been recorded"
>>>>>>> parent of bb26147... Fixed issue with flags not displaying
      new_flag = Flag.new
      new_flag.flag_id = risk_id
      new_flag.member_id = @member.id
      new_flag.solution_in_process = FALSE
      new_flag.save

    elsif !risk_boolean and flag_exists
      #There is no risk so we need to delete the flag
<<<<<<< HEAD
      current_flag.destroy_all
=======
      # puts "There is no risk so we need to delete the flag"
      current_flag.first.destroy
>>>>>>> parent of bb26147... Fixed issue with flags not displaying
    end
  end



end
