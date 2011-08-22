class Spending < Transaction
  default_value_for :vendor_country, 'Nederland'
  default_value_for :opvoerbaarheid_pct, 100
  
  def opvoerbaarheid_pct
    if opvoerbaarheid_ppm
      opvoerbaarheid_ppm / 10_000.0
    else
      nil
    end
  end
  
  def opvoerbaarheid_pct=(value)
    if value
      self.opvoerbaarheid_ppm = (value * 10_000).to_i
    else
      self.opvoerbaarheid_ppm = nil
    end
  end
end

