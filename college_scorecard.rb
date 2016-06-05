require "csv"
require 'pry'


###PART 1
def print_colleges_by_state(state)
  contents = CSV.open "2013_college_scorecards.csv", headers: true, header_converters: :symbol
  contents.each do |row|
    puts row [:instnm] if row[:stabbr] == state
  end
end


if ARGV[0] == "by_state"
  print_colleges_by_state(ARGV[1])
end

###PART 2
  def sort_schools_by_average_faculty_salary
    contents = CSV.open "2013_college_scorecards.csv", headers: true, header_converters: :symbol
    contents.sort_by do |row|
      row[:avgfacsal].to_i
    end.reverse
  end

  def print_colleges(number_of_colleges, contents)
    i = 0
    contents.each do |row|
      if i < number_of_colleges.to_i
        puts row[:instnm]
        i += 1
      end
    end
  end

if ARGV[0] == "top_average_faculty_salary"
  contents = sort_schools_by_average_faculty_salary
  print_colleges(ARGV[1], contents)
end


###Part 3
def sort_colleges_by_median_debt
  contents = CSV.open "2013_college_scorecards.csv", headers: true, header_converters: :symbol
  contents.sort_by do |row|
    row[:grad_debt_mdn].to_i
  end.reverse
end

def print_colleges_with_debt_between(lower, upper, contents)
  contents.each do |row|
    if row[:grad_debt_mdn].to_i < upper.to_i && row[:grad_debt_mdn].to_i > lower.to_i
      puts "#{row[:instnm]} ($#{row[:grad_debt_mdn]})"
    end
  end
end

if ARGV[0] == "median_debt_between"
  contents = sort_colleges_by_median_debt
  print_colleges_with_debt_between(ARGV[1],ARGV[2],contents)
end
