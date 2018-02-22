class Employee

  attr_reader :salary
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = self.salary * multiplier
    puts "bonus: #{bonus}"
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss, employees=[])
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total_salary_all = @employees.map { |employee| employee.salary }.reduce(:+)
    bonus = total_salary_all * multiplier
    puts "bonus: #{bonus}"
  end

  def add_employee(employees)
    employees.each do |employee|
      @employees.push(employee)
    end
  end
end

ned = Manager.new("Ned", "Founder", 1_000_000, nil, [])
darren = Manager.new("Darren", "TA Manager", 78_000, ned, [])

# darren = Manager.new("Darren", "TA Manager", 78_000, ned)
david = Employee.new("David", "TA", 10_000, darren)
shawna = Employee.new("Shawna", "TA", 12_000, darren)
ned.add_employee([darren, david, shawna])
darren.add_employee([david, shawna])

ned.bonus(5) # => 500_000
darren.bonus(4) # => 88_000
david.bonus(3) # => 30_000
