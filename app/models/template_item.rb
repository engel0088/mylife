class TemplateItem
   include MongoMapper::Document

   ITEM_PUBLICITY = %w[public_item private_item]

   key :text, String, :required => true # must be present
   key :publicity, :required => true
   key :max_star_count, Integer # default 7
   key :priority, Integer
   key :star_resource_url, String

   # association
   belongs_to :item_category
   timestamps!
   attr_accessible :text, :publicity, :max_star_count, :priority, :star_resource_url, :item_category

   ## public/private
   # ================================================================
   def self.public_item
      ITEM_PUBLICITY[0]
   end
   def self.private_item
      ITEM_PUBLICITY[1]
   end
   # getter publicity property
   def public_item?
      self.publicity == ITEM_PUBLICITY[0]
   end
   def private_item?
      self.publicity == ITEM_PUBLICITY[1]
   end

end
