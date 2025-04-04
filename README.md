# Library Challenge

#### A Library project that allows a user to:

⚪ See the list of available books. <br>
⚪ Checkout a book if it's available. <br>
⚪ Have a return date on a book checkout. <br>

```
## Dependencies

Ruby ( Ruby 3.3.7 (2025-01-15 revision be31f993d7) [x64-mingw-ucrt])<br>
RSpec
```

## Setup:
Clone my repository using the web URL:

https://github.com/FahadBinQaiser/Library_challenge.git

After cloning, run **bundle install** in your terminal.

## Type IRB in your terminal

``` 
⚪ irb
```

```ruby
Then load the files using require

⚪ require './lib/library'
⚪ require './lib/person'
```

```ruby
Create a library instance

⚪ library = Library.new 
⚪ library.list_books
```

```ruby
Create a person instance

⚪ person = Person.new("Fahad") 
⚪ person.books_list 
```

```ruby
For checking out a book, type

⚪ book_title = 'Alfons och soldatpappan'
⚪ library.checkout_book(book_title, person)
```

### Check person books_list and library books

For person list,

```ruby
⚪ person.books_list
```
For library list,

```ruby
⚪ library.list_books
```

### Check return date 

```ruby
⚪ library.return_date(book_title)
```

### License
This project is licensed under the MIT license, See the license file for more information.


