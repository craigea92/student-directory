# lets get the names of students & cohort from user input
def input_students
  puts "Please enter the name of the first student"
  puts "To finish, press Enter twice to end"
# create an empty array
  students = []
# get the student's name & cohort
  name = gets.chomp
  puts "Please enter the cohort for this student"
  cohort = gets.chomp
# while the name & cohort are not empty, repeat this code
  while !name.empty? || !cohort.empty? do
    name = "Anonymous" if name.empty?
    cohort = "november" if cohort.empty?
    confirm_info(name, cohort)
    conf_n = gets.chomp
# while the students info is wrong, repeat this code
    while conf_n != "1"
      name = gets.chomp
      cohort = gets.chomp
      name = "Anonymous" if name.empty?
      cohort = "november" if cohort.empty?
      confirm_info(name, cohort)
      conf_n = gets.chomp
    end
# add the student hash to the array & convert cohort to a symbol, if students 1 > then print students
    students << {name: name, cohort: cohort.to_sym}
    students.count > 1 ? s_or_p = "students" : s_or_p = "student"
    puts "Now we have #{students.count} #{s_or_p}, please enter another name or press Enter twice to end"
# get another student info
    name = gets.chomp
    puts "Please enter the cohort for this student"
    cohort = gets.chomp
  end
  students
end

# confirm the user input back to the user
def confirm_info(name, cohort)
  puts "Name: [#{name}], Cohort: [#{cohort}]"
  puts "Yes => 1, No => 2"
end

# lets use an if statement to print the cohorts if the user has entered students
  def print(students)
    if students.count != 0  
      puts "The students of Villains Academy"
      puts "-------------"
      cohort_group = students.map{|student| student[:cohort]}.uniq
      cohort_group.each do |group|
        puts "[The #{group} cohort]:"
        puts students.map{|student| student[:name] if student[:cohort] == group }.compact
        puts ""
      end
# finally print the student(s) count     
      students.count > 1 ? s_or_p = "students" : s_or_p = "student"
      puts "Overall, we have #{students.count} great #{s_or_p}"
    else 
      puts "You haven't entered any student information!"
    end
  end

# nothing happens until we call the methods
students = input_students
print(students)
