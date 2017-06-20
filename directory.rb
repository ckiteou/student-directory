def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students =[]
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
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
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
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
