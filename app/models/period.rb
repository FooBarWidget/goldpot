class Period
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  
  attr_accessor :start_date
  attr_accessor :end_date
  
  def self.parse(str)
    period = new
    start_date_str, end_date_str = str.split(":", 2)
    period.start_date = parse_date_str(start_date_str)
    period.end_date   = parse_date_str(end_date_str)
    period
  end
  
  def to_param
    date_to_str(start_date) << ":" << date_to_str(end_date)
  end
  
  def transactions
    Transaction.where(find_conditions).order(:date)
  end
  
  def spendings
    Spending.where(find_conditions).order(:date)
  end
  
  def earnings
    Earning.where(find_conditions).order(:date)
  end

private
  def self.parse_date_str(str)
    str =~ /\A(\d\d\d\d)-(\d\d)-(\d\d)\Z/
    Date.civil($1.to_i, $2.to_i, $3.to_i)
  end
  
  def date_to_str(date)
    "%04d-%02d-%02d" % [date.year, date.month, date.day]
  end
  
  def find_conditions
    ['date >= ? AND date <= ?', start_date, end_date]
  end
end
