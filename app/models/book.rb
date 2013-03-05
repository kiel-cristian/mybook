class Book < ActiveRecord::Base
  itemize

  # attributes
  attr_accessible :author, :date, :tittle
end
