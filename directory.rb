def input_students
  puts 'Please enter the name of the student'
  students = []
  name = gets.chomp
  while !name.empty?
    print "Hobby: "
    hobbie = gets.chomp
    print "Height: "
    height = gets.chomp
    print "Postcode: "
    postcode = gets.chomp
    print "Contry of Birth: "
    c_o_b = gets.chomp
    re_enter = "R"
    while re_enter == "R"
    print "Cohort: "
    cohort = gets.chomp
      if cohort.empty?
        cohort = "November"
        cohort = cohort
      end
        print "Press 'R' to re-enter cohort, otherwise press any key to carry on"
        re_enter = gets.chomp
    end
    students << {name: name, hobbie: hobbie, height: height, postcode: postcode, c_o_b: c_o_b, cohort: cohort}
    if students.count == 1
      puts "Now we have #{students.count} student."
    else
      puts "Now we have #{students.count} students."
    end
    puts "Enter another student or hit return to finish"
    name = gets.chomp
  end
  students
end

#students = []

def print_header
  puts  "The Students of Villains Academy".center(34,"*")
  puts  "----------------------------------"
end

def select_name_shorter_than_12(student)
  to_return = []
  student.each do |student|
    to_return << student if student[:name].length < 12
  end
  to_return
end

def select_name_starting_with_char(student)
  to_return = []
  student.each do |student|
    to_return << student if student[:name].start_with?("C") || student[:name].start_with?("c")
  end
  to_return
end

def print_students(students)
  students.sort_by! { |student| :cohort }
  students.each do |student|
    print ("Name: #{student[:name]} ".ljust(24))
    print ("Hobbie: #{student[:hobbie]} ".ljust(24))
    print ("Height: #{student[:height]} ".ljust(24))
    print ("Postcode: #{student[:postcode]} ".ljust(24))
    print ("Country of Birth: #{student[:c_o_b]} ".ljust(24))
    print ("Cohort #{student[:cohort]} ".ljust(24))
    print "\n"
  end
end

def print_footer(names)
  puts
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
shorter_than_12 = select_name_shorter_than_12(students)
shorter_than_12_and_only_char = select_name_starting_with_char(shorter_than_12)
print_students(shorter_than_12_and_only_char)
print_footer(shorter_than_12_and_only_char)
