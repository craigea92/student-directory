require 'csv'
@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    menu
    process(STDIN.gets.chomp)
  end
end

def menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students"
  puts "4. Load the list of students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def process(selection)
  case selection
  when "1" 
    input
    feedback(action = "Input")
  when "2" 
    show
    feedback(action = "Print")
  when "3" 
    save
    feedback(action = "Save")
  when "4"
    filename = "none"
    load(filename)
    feedback(action = "Load")
  when "9" then exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def feedback(action)
  puts "\n#{action} has completed successfully!\n\n"
end

def input
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp # get the first name
  while !name.empty? do # while name is not empty, repeat this code
    add(name) # add the student hash to the array
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp # get another name from the user
  end
end

def add(name, cohort = "november")
  @students << {name: name, cohort: cohort.to_sym}
end

def show
  header
  student_list
  footer
end

def header
  puts "The students of Villains Academy"
  puts "-------------"
end

def student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def footer
  puts "Overall, we have #{@students.count} great students"
  puts ""
end

def save
  puts "Please enter the filename to save:"
  filename = STDIN.gets.chomp
  CSV.open(filename, "wb") do |csv| # open the file for writing
  # iterate over the array of students
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
end

def load(filename)
  if filename == "none"
    puts "Please enter the filename to load:"
    filename = STDIN.gets.chomp
    @students = []
  end
  CSV.foreach(filename) do |line|
    name, cohort = line [0], line[1]
    add(name, cohort)
  end
end

def try_load
  filename = ARGV.first# first argument from the command line
  filename = "students.csv" if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load
interactive_menu