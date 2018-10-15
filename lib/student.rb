class Student
  # connection to database: DB[:conn]
  
  # build out the Student class such that it has name and grade attributes and optionl id
  attr_accessor :name, :grade
  attr_reader   :id
  
  def initialize(name, grade, id = nil)
    @name  = name
    @grade = grade
    @id    = id 
  end
  
  # .create_table
  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        grade INTEGER
        )
        SQL
    DB[:conn].execute(sql)
  end 
  
  # .drop_table
  def self.drop_table
    sql = <<-SQL
      DROP TABLE students
      SQL
    DB[:conn].execute(sql)
  end 
  
  # #save_instance_to_table
  def save 
    sql = <<-SQL
      INSERT INTO students (name, grade)
        VALUES (?,?)
        SQL
    DB[:conn].execute(sql, self.name, self.grade)
    
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end 
  # #create_and_save_instance_to_table 
  def self.create(name, grade)
    student = Student.new(name, grade)
    student.save 
    student 
  end
end
