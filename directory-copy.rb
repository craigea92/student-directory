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
# add the student hash to the array & convert cohort to a symbol
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} student(s), please enter another name or press Enter twice to end"
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

# start by printing the header
def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end
# lets group the students by cohort and print them using .map
  def print(students)
    cohort_group = students.map{|student| student[:cohort]}.uniq
    cohort_group.each do |group|
      puts "[The #{group} cohort]:"
      puts students.map{|student| student[:name] if student[:cohort] == group }.compact
      puts ""
    end
  end
# finally print the student count
  def print_footer(names)
    puts "Overall, we have #{names.count} great student(s)"
  end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)