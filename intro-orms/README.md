# Intro to ORMs (Object Relational Mappers)

# OBJECTIVES
- Map "Rubyworld concepts to "SQLworld" equivalents:
    Scopes
    RUBY CLASS: SQL TABLE
    RUBY INSTANCE: SQL Table ROW
    RUBY INSTANCE VARIABLE: SQL TABLE CELL/COLUMN
    RUBY OBJECT HASH: DATABASE ROW ID

    Methods
    RUBY INITIALIZE: SQL INSERT (Create action)
    RUBY CLASS.ALL: SQL SELECT (Read action)
    RUBY ATTR_WRITER: SQL UPDATE (Update action)
    RUBY CLEAR @@all (or garbage collection): SQL DELETE (Delete action)

- Connect Ruby code to a SQL database using the SQLite3 *gem*
- Write Ruby methods that execute SQL commands against the database
- Convert data into Ruby objects, and vice versa!

# KEY TAKEAWAYS

* Our environment.rb file now does all it did before (requiring our gems as well as all app classes), and it ALSO now makes a connection to our twitter.db file
* We can access this connection using the `DB` hash and its [:conn] value
* By calling `DB[:conn].execute("SQL STRING HERE";)` we can execute any SQL of our choosing against the database.
* Our Tweet.all method returned an array of all saved tweets, by:
  - using a "SELECT * FROM tweets" query in DB[:conn].execute() to get an array of hashes from the database, each hash representing one db row from `tweets` 
  - iterating over those tweet row hashes using `map`
  - in the `map` block, calling `Tweet.new` and passing in the tweet row hash
* Our Tweet.find method returned a searched-for tweet, by:
  - using a "SELECT * FROM tweets WHERE id = ?" query in DB[:conn].execute()
  - passing in a second argument for the id after the string in `execute()` to fill in the missing value at the string's `?`
  - returning the first hash from the array that comes back
  - If no hash was present, returning nil; otherwise, using Tweet.new() with the hash as the argument
* Our Tweet#save method updated the database by:
  - Using an INSERT sql query in DB[:conn].execute() if no id was present on the Tweet instance
  - Using an UPDATE sql query in DB[:conn].execute() if an id was present, using the id as the WHERE value in the query

# DOMAIN MODEL REVIEW

A tweet belongs to a user and has some message content

A user has a username, and has many tweets

(The "belonging" thing, the tweet, must have a foreign key on it. Not so for the "having" user)

A tweet can have many tags and a tag can have many tweets
