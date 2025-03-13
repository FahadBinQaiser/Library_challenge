require './lib/library'
describe Library do
  let(:library) { Library.new }
  it 'shows a list of available books' do 
    expect(library.list_books).to eq(["The Hobbit by J.R.R. Tolkien"])  
  end
end