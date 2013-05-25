class AdAgency
   include MongoMapper::Document
   
   key :name, String #, :required => true   validates_presence_of
   key :description, String
   key :photo_url, String
   key :email, String

   validates_presence_of :name
   validates_presence_of :email

   timestamps!

   attr_accessible :name, :description, :photo_url, :email
end
