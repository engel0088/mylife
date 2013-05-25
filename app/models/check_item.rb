class CheckItem < TemplateItem

  key :rate, Integer

  belongs_to :check_date
  timestamps!

  attr_accessible :rate, :check_date
end
