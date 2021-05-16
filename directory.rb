# let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# start by printing the header
def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end
# and then print the student names
  def print(names)
    names.each do |name|
      puts name
    end
  end
# finally print the student count
  def print_footer(names)
    puts "Overall, we have #{names.count} great students"
  end

# nothing happens until we call the methods
print_header
print(students)
print_footer(students)