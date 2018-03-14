class Fan
  # we can still hold on to our attr_accessors for our attributes
  attr_accessor :name, :artist_id
  # however, only the database should be able to assign ids, so we use attr_reader
  attr_reader :id

  # we are no longer going to keep an array of instances as a class variable
  # instead, we will be querying the database directly for our information
  # @@all = []

  # this initialize method still uses the old way of pulling in arguments one at a time
  # def initialize(name, artist_id)
  #   @name = name
  #   @artist_id = artist_id
  #   # we aren't going to save right from the initialize method anymore - why??
  #   # self.save
  # end

  # what if we want to initialize with a hash of attributes
  def initialize(fan_attributes) # fan_attributes = { name: "Howard", artist_id: 34 }
    binding.pry
    @name = fan_attributes[:"name"]
    @artist_id = fan_attributes[:"artist_id"]
  end

  # ------ instance methods ------

  # save a instance to the db as a row
  def save
    # what is missing here?  what kind of validations can we easily add?

    # let's write some SQL to save the instance
    sql = <<-SQL
      INSERT INTO fans (name, artist_id) VALUES (?, ?)
    SQL

    # save instance to the database
    DB.execute(sql, self.name, self.artist_id)

    # the return of the above execution is an empty array, but I
    # want immediate feedback to know that my instance saved properly
    # Therefore, I take the (somewhat convoluted) steps of finding the
    # last saved ID, then immediately querying the db for it.

    # get the id of the last saved row in fans
    max_id = DB.execute('SELECT MAX(id) FROM fans')[0][0]
    # query the db for the last object via id
    DB.execute("SELECT * FROM fans WHERE id=?", max_id)
  end

  # how can we update, given a hash of attributes?
  # this is a bit of a challenging method ... several ways to do this ....
  def update(attributes)

  end

  # delete a record from the database
  def delete(argument) # <-- what argument goes here?

  end

  # ------ class methods -------

  # right now, we're getting back arrays of hashes from our db.  let's turn these into Ruby class instances we can use
  def self.new_from_row(fan_row_from_db)
    fan = Fan.new(fan_row_from_db)
    fan.instance_variable_set(:@id, fan_row_from_db["id"])
    fan
  end

  # create should instantiate a new instance and save it to the database
  def self.create(attributes)
    new_fan = self.new(attributes)
    new_fan.save
  end

  # all should return all instances of the class from the database
  def self.all
    sql = <<-SQL
      SELECT * FROM fans
    SQL

    fan_rows_from_db = DB.execute(sql)
    fan_rows_from_db.map do |fan_row_from_db|
      self.new_from_row(fan_row_from_db)
    end
  end

  # how many records are there?
  def self.count
    sql = <<-SQL
      SELECT COUNT(*) FROM fans
    SQL

    DB.execute(sql)
  end

  # find an instance by id
  def self.find(id)
    sql = <<-SQL
      SELECT * FROM fans WHERE id = ?
    SQL

    DB.execute(sql, id)
  end

  # given a name, return a record
  # what do I want to return if nothing is found?
  def self.find_by_name(name)

  end

  # imagine finding (an) instance(s) given a hash of attributes
  # how could we implement this?
  def self.find_by(attributes)

  end

  def self.reset_fan_table
    drop_table = <<-SQL
      DROP TABLE IF EXISTS fans;
    SQL

    create_table = <<-SQL
      CREATE TABLE IF NOT EXISTS fans (id INTEGER PRIMARY KEY, name TEXT, artist_id INTEGER);
    SQL

    DB.execute_batch(drop_table + create_table)
    # DB.execute(create_table)
  end

end
