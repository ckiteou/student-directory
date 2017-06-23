@students =

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  #shorter_than_12 = select_name_shorter_than_12(@students)
  #shorter_than_12_and_only_char = select_name_starting_with_char(shorter_than_12)
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # thiswill cause the program to terminate
  else
    puts "I don't know what you mean, try again"
  end
end

def input_students
  print 'Please enter the name of the student: '
  name = gets.delete("\n")
  while !name.empty?
    print "Age: "
    age = gets.delete("\n")
    print "Hobby: "
    hobby = gets.delete("\n")
    print "Postcode: "
    postcode = gets.delete("\n")
    print "Country of Birth: "
    c_o_b = gets.delete("\n")
    re_enter = "a"
    while re_enter == "a"
    print "Cohort: "
    cohort = gets.delete("\n").to_sym
    if cohort.empty?
      cohort = :November
    end
    puts "To re-enter cohort type 'a' and press return or press return to continue"
    re_enter = gets.delete("\n")
    end
    @students << {name: name, age: age, hobby: hobby, postcode: postcode, c_o_b: c_o_b, cohort: cohort}
    if @students.count == 1
      puts "Now we have #{@students.count} student."
    else
      puts "Now we have #{@students.count} students."
    end
    puts "Enter another student or press return to finish"
    name = gets.delete("\n")
  end
end

def print_header
  puts  "The Students of Villains Academy".center(140)
  puts  "--------------------------------".center(140)
end
=begin
def select_name_shorter_than_12(student)
  to_return = []
  student.each do |student|
    to_return << student if student[:name].length < 12
  end
  to_return
end
=end
=begin
def select_name_starting_with_char(student)
  to_return = []
  student.each do |student|
    to_return << student if student[:name].start_with?("C") || student[:name].start_with?("c")
  end
  to_return
end
=end
def print_students_list
  @students.sort_by! { |student| student[:cohort] }
  @students.each do |student|
    print ("Name: #{student[:name]} ".ljust(24))
    print ("Age: #{student[:age]} ".ljust(24))
    print ("Hobby: #{student[:hobby]} ".ljust(24))
    print ("Postcode: #{student[:postcode]} ".ljust(24))
    print ("Country of Birth: #{student[:c_o_b]} ".ljust(24))
    print ("Cohort: #{student[:cohort]} ".ljust(24))
    print "\n"
  end
end

def print_footer
  puts
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu
