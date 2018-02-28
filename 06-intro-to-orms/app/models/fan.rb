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
    @name = fan_attributes[:name]
    @artist_id = fan_attributes[:artist_id]
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

    DB.execute(sql)
  end

  # how many records are there?
  def self.count

  end

  # find an instance by id
  def self.find(id)
    sql = <<-SQL
      SELECT * FROM fans WHERE id = #{id}
    SQL
    puts "sql is "
    puts sql
    DB.execute_batch(sql)
  end

  # given a name, return a record
  # what do I want to return if nothing is found?
  def self.find_by_name(name)

  end

  # imagine finding (an) instance(s) given a hash of attributes
  # how could we implement this?
  def self.find_by(attributes)

  end

end
