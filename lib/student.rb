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
    sql = <<-SQL
    
    SQL 
  end 
  
  # .drop_table
  # #save_instance_to_table
  # #create_and_save_instance_to_table 


  
  
end
