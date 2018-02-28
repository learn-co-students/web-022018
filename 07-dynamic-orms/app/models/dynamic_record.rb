class DynamicRecord
  def self.table_name
    self.to_s.downcase + "s"
  end

  def self.table_info
    sql = <<-SQL
      PRAGMA table_info (#{self.table_name})
    SQL

    DB.execute(sql)
  end

  def self.column_names
    columns = self.table_info
    columns.map {|col| col['name']}
  end

  def initialize(attributes) # fan_attributes = { name: "Howard", artist_id: 34 }

  end

  # ------ instance methods ------

  # save a instance to the db as a row
  def save
    sql = <<-SQL
      INSERT INTO fans (name, artist_id) VALUES (?, ?)
    SQL

    DB.execute(sql, self.name, self.artist_id)

    max_id = DB.execute('SELECT MAX(id) FROM fans')[0][0]

    resp = DB.execute("SELECT * FROM fans WHERE id=?", max_id)[0]
    Fan.format_sql(resp)
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

    resp = DB.execute(sql)
    resp.map{|row| Fan.format_sql(row)}
  end


  # find an instance by id
  def self.find(id)
    sql = <<-SQL
      SELECT * FROM fans WHERE id = ?
    SQL
    # puts "sql is "
    # puts sql
    resp = DB.execute(sql, id)[0]
    Fan.format_sql(resp)
  end

  def self.format_sql(response)
    # {"id"=>1, "name"=>"niky", "artist_id"=>11, 0=>1, 1=>"niky", 2=>11
    name = response['name']
    id = response['id']
    artist_id = response['artist_id']
    Fan.new(name: name, id: id, artist_id: artist_id)
  end



end
