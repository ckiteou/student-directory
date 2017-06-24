@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "Please select a number from the following options:"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from the students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you mean by '#{selection}', try again"
    puts "-------------------------------------"
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
   if filename.nil?
     load_students
     puts "Loaded #{@students.count} from 'students.csv'"
   else
     if_load_file_exists(filename)
  end
end

def if_load_file_exists(filename)
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exists
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, age, hobby, postcode, c_o_b, cohort = line.chomp.split(",")
    add_students_to_var(name, age, hobby, postcode, c_o_b, cohort)
  end
  file.close
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:age], student[:hobby], student[:postcode], student[:c_o_b], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def add_students_to_var(name, age, hobby, postcode, c_o_b, cohort)
  @students << {name: name, age: age, hobby: hobby, postcode: postcode, c_o_b: c_o_b, cohort: cohort.to_sym}
end

def input_students
  print 'Please enter the name of the student: '
  name = STDIN.gets.delete("\n")
  while !name.empty?
    print "Age: "
    age = STDIN.gets.delete("\n")
    print "Hobby: "
    hobby = STDIN.gets.delete("\n")
    print "Postcode: "
    postcode = STDIN.gets.delete("\n")
    print "Country of Birth: "
    c_o_b = STDIN.gets.delete("\n")
    re_enter = "a"
    while re_enter == "a"
    print "Cohort: "
    cohort = STDIN.gets.delete("\n")
    if cohort.empty?
      cohort = "November"
    end
    puts "To re-enter cohort type 'a' and press 'return', or press 'return' to continue"
    re_enter = STDIN.gets.delete("\n")
    end
    add_students_to_var(name, age, hobby, postcode, c_o_b, cohort)
    if @students.count == 1
      puts "Now we have #{@students.count} student."
    else
      puts "Now we have #{@students.count} students."
    end
    puts "Enter another student or press return to finish"
    name = STDIN.gets.delete("\n")
  end
end

def show_students
  print_header
  #shorter_than_12 = select_name_shorter_than_12(@students)
  #shorter_than_12_and_only_char = select_name_starting_with_char(shorter_than_12)
  print_students_list
  print_footer
end

def show_students
  print_header
  #shorter_than_12 = select_name_shorter_than_12(@students)
  #shorter_than_12_and_only_char = select_name_starting_with_char(shorter_than_12)
  print_students_list
  print_footer
end

def print_header
  puts  "The Students of Villains Academy".center(140)
  puts  "--------------------------------".center(140)
end

def print_students_list
  @students.sort_by! { |student| :cohort }
  @students.each do |student|
    print ("Name: #{student[:name]} ".ljust(24))
    print ("Age: #{student[:age]} ".ljust(24))
    print ("Hobby: #{student[:hobby]} ".ljust(24))
    print ("Postcode: #{student[:postcode]} ".ljust(24))
    print ("Country of Birth: #{student[:c_o_b]} ".ljust(24))
    print ("Cohort: #{student[:cohort]} ".ljust(24))
    print ("\n")
  end
end

def print_footer
  puts
  puts "Overall, we have #{@students.count} great students"
  puts
end

try_load_students
interactive_menu
