class User
   include MongoMapper::Document

   key :email, String, :required => true
   key :password, String, :required => true
   key :name, String, :required => true


   timestamps!
end
