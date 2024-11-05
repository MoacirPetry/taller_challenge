### Setup

Make sure to have the **ruby 3.3.0** and **rails 7.1.3**

Clone the repository and execute the following command: `bundle install`

### Access the app

`rails server`

The root page will list the books by default

Go to http://localhost:3000/

# Rake task to create books

This task creates books for purposes of creating something to list on web pages

It creates 7 books: `rake books:create n=7`

It cleans up all books: `rake books:create`


### Rspec tests

`rspec spec/`

> Note: I didn't have time to finish the POST/PATCH tests

### Postman

There is a taller_challenge.postman_collection.json file in the root path with all methods to test the app.