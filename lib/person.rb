# frozen_string_literal: true

require 'date'
# A person class that can borrow books from the library
class Person
  attr_reader :name, :books_list

  def initialize(name)
    @name = name
    @books_list = []
  end
end
