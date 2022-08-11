require './book'

describe Book do
  before :each do
    @book = Book.new 'Technology', 'Ademola'
  end

  it 'takes two parameters and returns a Book object' do
    expect(@book).to be_instance_of Book
  end

  it 'should show the book title' do
    expect(@book.title).to eq 'Technology'
  end

  it 'should show the book author' do
    expect(@book.author).to eq 'Ademola'
  end
end
