# lets get the names of students from user input
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
# create an empty array
  students = []
# get the student name, hobby, country of birth & height
  name = gets.chomp
  puts "What is this students favourite hobby?"
  hobby = gets.chomp
  puts "What is this students country of birth?"
  birth = gets.chomp
  puts "What is this students height in cm?"
  height = gets.chomp
# while the name is not empty, repeat this code
  while !name.empty? do
# add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby, birth: birth, height: height}
    puts "Now we have #{students.count} student(s), please enter another name or press Enter to end"
# get another name from the user
    name = gets.chomp
# when the name is empty, ask for other information
    if !name.empty?
      puts "What is this students favourite hobby?"
      hobby = gets.chomp
      puts "What is this students country of birth?"
      birth = gets.chomp
      puts "What is this students height in cm?"
      height = gets.chomp
    end  
  end
# return the array of students
  students
end

# start by printing the header
def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end
# and then print the student names
  def print(students)
    count = 0
    while count < students.count
      student_info = "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort), favourite hobby: #{students[count][:hobby]}, country of birth: #{students[count][:birth]}, height(cm): #{students[count][:height]}"
      puts student_info.center(student_info.length + 10)
      count += 1
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