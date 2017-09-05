## Active Record Pattern

- each table in our db should correspond to a ruby class (models)
- instances of one of those classes are represented by a single on the table
- each column represent an attribute on each instance

## Object Relational Mapper (ORM)



## CRUD REVIEW

What are the four ways we can interact with data?

Create
- INSERT INTO books (title, author_id) VALUES ('POODR', 1)
- book = Book.new({'title' => 'POODR', 'author_id' => 1})
- book.save
Read
- SELECT * FROM books
- Book.all
- SELECT * FROM books WHERE id = 5 LIMIT 1
- Book.find(5)
- Book.find_by_id(5)

Update
- UPDATE books SET (title, author_id) VALUES ('some new title', 1) WHERE id = 3
- book.update({'title' => 'new title'})

Destroy
- DESTROY books WHERE id = 3
- book.destroy

## Domain Modeling and SQL Review

Draw out what your schema (structure of your tables and columns) would be for the following domains. Consider what tables are needed, what columns belong on which tables, and where the foreign keys belong.

1. Books and Authors where each book has a single author. Books should have a title and authors should have a name

books
id | title                                      |author_id |
1    Practical Object Oriented Design in Ruby     1
2    Secrets of the JavaScript Ninja              2
3    99 Bottles of OOP                            1
4   Advanced JS                                   2

authors
id | name       
1   Sandi Metz
2   John Resig

Q: Write the SQL to find all books written by a certain author given the author's id.
```SQL
SELECT * FROM books WHERE books.author_id = 1
```

2. Books and Authors where each book can have one or multiple authors. Books should have a title and authors should have a name

books
id | title                                     
1    Practical Object Oriented Design in Ruby     
2    Secrets of the JavaScript Ninja              
3    99 Bottles of OOP                            
4    Ruby and JS Together!

book_authors
id | book_id | author_id  
1       4       1   
2       4       2   
3       1       1                    

authors
id | name       
1   Sandi Metz
2   John Resig

Q: Write the SQL to find all books written by a certain author given their name

```SQL
SELECT * FROM books
INNER JOIN book_authors
ON books.id = book_authors.book_id
INNER JOIN authors
ON authors.id = book_authors.author_id
WHERE authors.name = 'Sandi Metz'
```

3. Twitter where Tweets can have Tags (i.e. '#fun', '#hottake', '#tbt'). A tweet can have multiple tags, many tweets can be tagged with the same tag. Tweets have a message and user_id; tags have a name.

tweets
id | message                                              | user_id
1    'Practical Object Oriented Design in Ruby  is cool'    5

tweet_tags
id | tweet_id | tag_id
1       1          2
2       17         2
2       17         1

tags
id | name       
1   'tbt'
2   'fun'

Q: Write the SQL to find all the tweets tagged '#tbt'

```SQL  
SELECT * FROM tweets
INNER JOIN tweet_tags
ON tweets.id = tweet_tags.tweet_id
INNER JOIN tags
ON tags.id = tweet_tags.tag_id
WHERE tag.name = 'tbt'
```

4. After completing the questions above, is there a rule you can determine about which table the foreign key belongs on given two associated tables?
