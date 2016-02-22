require 'minitest/autorun'
require 'minitest/pride'
require './employee.rb'
require './department.rb'

require 'active_record'
ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'test.sqlite3'
)


ActiveRecord::Migration.verbose = false

class EmployeeReviews < Minitest::Test

  def setup
    begin EmployeeReviewsMigration.migrate(:up); rescue; end
  end

  def teardown
    EmployeeReviewsMigration.migrate(:down)
  end

  def test_classes_exist
    assert Department
    assert Employee
    assert Reviews
  end

  def test_employees_can_be_created_and_named
    new_employee = employee.new(name: "Hugh", email: "hugh_l@me.com", phone: "919-365-6666", salary: "A GAZILLION DOLLA$")
    assert new_employee
  end

  def test_departments_can_be_created_and_named
    new_department = department.new(name: "Auditory Afficianado Emporium")
    assert new_department
  end

  def test_employees_can_be_added_to_departments
    d = department.new (name: "Human Resources")
    new_employee = employee.new(name: "Hugh", email: "hugh_l@me.com", phone: "919-365-6666", salary: "A GAZILLION DOLLA$")
    d.employees << new_employee
    assert_equal [new_employee], d.employees
    assert_equal d, new_employee.department
  end

  def test_employee_name_can_be_retreived
    new_employee = employee.new(name: "Hugh", email: "hugh_l@me.com", phone: "919-365-6666", salary: "A GAZILLION DOLLA$")
    assert_equal "Hugh" , new_employee.name
  end

  def test_employee_salary_can_be_retreived
    new_employee = employee.new(name: "Hugh", email: "hugh_l@me.com", phone: "919-365-6666", salary: "A GAZILLION DOLLA$")
    assert_equal "A GAZILLION DOLLA$", new_employee.salary
  end

  def test_department_name_can_be_retreived
    new_department = department.new(name: "Auditory Afficianado Emporium")
    assert_equal "Auditory Afficianado Emporium", new_department.name
  end

  def test_can_calculate_department_total_salary
    new_department = department.new(name: "Auditory Afficianado Emporium")
    new_employee = employee.new(name: "Hugh", email: "hugh_l@me.com", phone: "919-365-6666", salary: "5,000,000")
    old_employee = employee.new(name: "Robert", email: "robert@me.com", phone: "336-682-7343" salary: "5,000,000")
    assert d.add_employee (new_employee)
    assert d.add_employee (old_employee)
    assert_equal department.salary, "10,000,000"
  end

  def employees_can_be_reviewed
	  new_employee = employee.new(name: "New Kanye West", email: "yeezus_saves@goodmusic.com", phone: "666-666-6666", "1")
	  assert kanye west.add_employee_review(negative_review) 

  end

  def employee_satisfactory_drone_or_not
  	new_employee = employee.new(name: "New Kanye West", email: "yeezus_saves@goodmusic.com", phone: "666-666-6666", salary: "40")
  	old_employee = employee.new(name: "Old Kanye West", email: "kanye@pinkpolosandraybansforever.com", phone: "333-333-3333", salary: "1,000,0000,0000")
  	new_employee.satisfactory(false)
  	old_employee.satisfactory(true)
  	refute new_employee.satisfactory
  	assert old_employee.satisfactory

  end

  def test_employee_can_receive_raise
  	new_employee = employee.new(name: "New Kanye West", email: "yeezus_saves@goodmusic.com", phone: "666-666-6666", salary: "40")
  	assert_equal "1,000,000", new_employee.good_job_have_a_treat()	  

  end

  def test_raise_allocation_of_departmental_raises
    d = Department.create(name: "Auditory Afficianado Emporium")
    	new_employee = employee.new(name: "New Kanye West", email: "yeezus_saves@goodmusic.com", phone: "666-666-6666", salary: "40")
    	old_employee = employee.new(name: "Old Kanye West", email: "kanye@pinkpolosandraybansforever.com", phone: "333-333-3333", salary: "1,000,0000,0000")
    a.add_employee("Chance The Rapper")
    d.add_employee(new_employee)
    d.add_employee(old_employee)
    assert new_employee_satisfactory == False
    assert old_employee_satisfactory? == True
    assert new_employee_satisfactory? == True
    d.department_raise("5,000") {|employee| employee.satisfactory && employee.salary < "100,000,00"}
    yield
    
    
  end

  def test_employee_eligible_for_raise
	end

  end

  # def assess_review_text_with_regexp
  #
  # end

  def test_ability_to_allocate_raises_to_employees_with_salary_less_than_100000

  end

  def test_boolean_assessment_of_employee_performance

  end

  def test_text_review_positive

  end

  def test_text_review_negative

  end

  def test_annual_employee_review
	  .review = review
	  positive_speech?
	  negative_speech?
	  department.give_raises(5000) do |employee|
	  employee.salary < 100000


  end
end
