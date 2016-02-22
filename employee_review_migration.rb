require 'active_record'

class EmployeeReviewsMigration < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :department
      t.string :name
      t.string :email
      t.string :phone
      t.decimal :salary, precision: 8, scale:2
      t.boolean :satisfactory
      t.string :review
      t.timestamps null: false
    end

    create_table :departments do |t|
      t.string :name
      t.string :review
      t.string :staff
      t.timestamps null: false
    end
  end
