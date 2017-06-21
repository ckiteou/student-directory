def input_students
  students =[]
  response = "Y"
  while !response.empty? do
    puts "Please enter the name of the student:"
    name = gets.chomp
    puts "Please enter the student's hobbie:"
    hobbie = gets.chomp
    puts "Please enter the student's height in metres:"
    height = gets.chomp
    puts "Please enter the student's postcode:"
    postcode = gets.chomp
    puts "Please enter the student's country of birth:"
    c_o_b = gets.chomp
    students << {name: name, hobbie: hobbie, height: height, postcode: postcode, c_o_b: c_o_b, cohort: :november}
    puts "Now we have #{students.count} students.\nTo enter another student press any key and hit 'Enter', otherwise just press 'Enter'"
    response = gets.chomp
  end
  students
end

def print_header
  puts  "The Students of Villains Academy"
  puts  "-------------"
end

def select_name_shorter_than_12(student)
  to_return = []
  student.each do |student|
    to_return << student if student[:name].length < 12
  end
  to_return
end

def select_name_starting_with_c(student)
  to_return = []
  student.each do |student|
    to_return << student if student[:name].start_with?("C") || student[:name].start_with?("c")
  end
  to_return
end

def select_name_shorter_than_12(student)
  to_return = []
  student.each do |student|
    to_return << student if student[:name].length < 12
  end
  to_return
end

def print(student)
  while student != nil
    student.collect do |student|
      puts "#{student[:name].center(34,"-")}\n#{student[:hobbie].center(34,"-")}\n#{student[:height].center(34,"-")}\n#{student[:postcode].center(34,"-")}\n#{student[:c_o_b].center(34,"-")}\n" + "(#{student[:cohort]} cohort)".center(34,"-")
      puts
    end
    break
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
shorter_than_12 = select_name_shorter_than_12(students)
shorter_than_12_and_only_c = select_name_starting_with_c(shorter_than_12)
print(shorter_than_12_and_only_c)
print_footer(shorter_than_12_and_only_c)
