class WelcomeController < ApplicationController
  def index
    if !params[:member_info].nil?
      puts params[:member_info[:gpa]]
    end

    members_id = 1
    @member= MemberInfo.find(members_id)
    risk_function(members_id)
    @flags = Flag.where(member_id = members_id.to_s)
  end

  def update_member_form
    puts "Here"
    @member =MemberInfo.find(1)
    member_values = params[:member_info]
    @member.gpa = member_values[:gpa]
    @member.save
    puts "Not here"
    redirect_to("welcome/index")

  end

  def risk_engine(member_id)

    #Finding member
    @member = MemberInfo.find(member_id)

    #Listing all the risks
    missing_sat = [@member.grade > 11 & @member.sat_score = 0, 1] # Does not have an SAT score even though in 12th grade
    low_grades  = [@member.gpa < 2,2] #GPA is below a 2.0

    #Combines all the risks into an array
    risk_list = [missing_sat, low_grades]

    #Checks each risk for the individual
    risk_list.each do |i|
      risk(i[0], i[1])
    end

  end

  def risk(risk_exists, risk_id)
    #Checks if there is a flag
    current_flag = Flag.where({member_id: @member.id.to_s , flag_id: risk_id.to_s})
    flag_exists = !current_flag.empty?



    if risk_exists and !flag_exists
      #There is a risk and it has not been recorded
      new_flag = Flag.new
      new_flag.flag_id = risk_id
      new_flag.member_id = @member.id
      new_flag.solution_in_process = FALSE
      new_flag.save

    elsif !risk_exists and flag_exists
      #There is no risk so we need to delete the flag
      current_flag.first.destroy
    end
  end

  def solution_engine(member_id)
  end


end
