require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @colunms if @colunms
    cols = DBConnection.execute2(<<-SQL)
      SELECT *
      FROM "#{self.table_name}"
    SQL

    @colunms = cols.first.map!(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |col|
      define_method("#{col}") do
        @attributes[col]
      end

      define_method("#{col}=") do |value|
        self.attributes[col] = value
      end
    end


  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    if @table_name
      @table_name
    else
      @table_name = self.to_s.tableize
    end
  end

  def self.all
    # ...
    data = DBConnection.execute(<<-SQL)
      SELECT *
      FROM "#{table_name}"
    SQL

    parse_all(data)

  end

  def self.parse_all(results)
    # ...
    results.map {|options| self.new(options)}
    # p all.each.map {|options| self.class.new(options)}
  end

  def self.find(id)
    # ...


    self.all.each do |row|
      # if row[id] == id
      #   return self.class.new(row)
      # end
      # p row
      # p row.attributes
      # p row.id
      if row.id == id
        return row
      end
    end
    return nil
  end

  def initialize(params = {})
    # ...
    params.each do |k, v|
      k = k.to_sym

      if self.class.columns.include?(k)
        self.send("#{k}=", v)
      # p "@#{k}".to_sym
      # define_method("@#{k}=") do |v|
      #   # "@#{k}="
      #   # "@#{k}" = v
      #   self.attributes[k.to_sym] = v
      else
        raise "unknown attribute '#{k}'"
      end
    end

  end

  def attributes
    # ...
     @attributes ||= {}
  end

  def attribute_values
    # ...
    @attributes.values

  end

  def insert
    # ...
    # p self.all
    
  end

  def update
    # ...
    row_instance = self.class.find(id)
    # row_instance = self


  end

  def save
    # ...
  end
end
