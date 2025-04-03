# frozen_string_literal: true

require_relative '../lib/person'
require_relative '../lib/library'

describe Person do
  let(:person) { Person.new('Fahad') }
  let(:library) { Library.new }

   it 'creates a person with a name and an empty list of books' do
    expect(person.name).to eq("Fahad")
    expect(person.books_list).to be_empty
   end
end
