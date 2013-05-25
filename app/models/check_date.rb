class CheckDate
   include MongoMapper::Document

   # indicate which day, what was up ....
   key :year, Integer
   key :month, Integer
   key :date, Integer
   key :day, Integer

   key :at, Time

   ## association
   many :check_items
   belongs_to :user

   timestamps!

   ## set method
   def set_at(param_date_time) #DateTime type

   end

   attr_accessible :year, :month, :date, :day, :check_items, :user
end
