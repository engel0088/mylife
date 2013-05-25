class ItemCategory
   include MongoMapper::Document

   key :name, String ,:required => true, :unique => true # must be present, and unique

   # association
   many :template_items

   attr_accessible :name, :template_items
end

ItemCategory.ensure_index :name, :unique => true
