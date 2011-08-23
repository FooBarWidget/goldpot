class Folder < ActiveRecord::Base
  has_many :transactions, :inverse_of => :folder, :order => :date
  has_many :spendings, :inverse_of => :folder, :order => :date
  has_many :earnings, :inverse_of => :folder, :order => :date
  
  validates_presence_of :name
  
  before_validation :nullify_blank_fields

private
  def nullify_blank_fields
    self.comments = nil if comments.blank?
  end
end
