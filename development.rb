require 'active_record'
require './database_configuration.rb'
require './employee.rb'
require './department'

EmployeeReviewsMigration.migrate(:up)
