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

def print(student)
  student.each_with_index do |student, index|
    index += 1
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
shorter_than_12 = select_name_shorter_than_12(students)
print(shorter_than_12)
print_footer(shorter_than_12)
