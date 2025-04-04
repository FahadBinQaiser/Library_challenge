# frozen_string_literal: true

require_relative '../lib/person'
require_relative '../lib/library'

describe Person do
  let(:person) { Person.new('Fahad') }
  let(:library) { Library.new }

  it 'creates a person with a name' do
    expect(person.name).to eq('Fahad')
  end
  it 'initializes with empty books' do
    expect(person.books_list).to be_empty
  end
end
