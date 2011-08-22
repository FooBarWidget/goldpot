class Spending < Transaction
  KINDS = {
    "Overig"           => { :vat => 19_00, :opvoerbaar => 100_00 },
    "Priveonttrekking" => { :vat => 0, :opvoerbaar => 0 },
    "Eten en drinken"  => { :vat => 6_00, :opvoerbaar => 73_50 },
    "Serverhuur"       => { :vat => 19_00, :opvoerbaar => 100_00 },
    "Juridisch"        => { :vat => 19_00, :opvoerbaar => 100_00 },
    "Merken, logo's en representatie" => { :vat => 19_00, :opvoerbaar => 100_00 },
    "Uitbesteed ontwikkeling" => { :vat => 19_00, :opvoerbaar => 100_00 },
  }
  KINDS_AS_JSON = KINDS.to_json
  
  default_value_for(:date) { Date.today }
  default_value_for :spending_kind, "Overig"
  default_value_for :opvoerbaarheid_pct, 100
  default_value_for :vendor_country, "Nederland"
  
  def opvoerbaarheid_pct
    if opvoerbaarheid_ppm
      opvoerbaarheid_ppm / 10_000.0
    else
      nil
    end
  end
  
  def opvoerbaarheid_pct=(value)
    if value
      self.opvoerbaarheid_ppm = (value.to_f * 10_000).to_i
    else
      self.opvoerbaarheid_ppm = nil
    end
  end
end

