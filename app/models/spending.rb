class Spending < Transaction
  # See also http://www.belastingdienst.nl/zakelijk/ondernemen_kosten/ondernemen_kosten-09.html
  KINDS = {
    "Overig"           => { :vat => 19_00, :opvoerbaar => 100_00 },
    "Priveonttrekking" => { :vat => 0, :opvoerbaar => 0 },
    "Voedsel, drank en dergelijke" => { :vat => 6_00, :opvoerbaar => 73_50 },
    
    "Boete" => {
      :vat => 0,
      :opvoerbaar => 0
    },
    "Hardware, kantoorartikelen en andere goederen" => {
      :vat => 19_00,
      :opvoerbaar => 100_00,
      :depreciable => true
    },
    "Juridische werkzaamheden" => {
      :vat => 19_00,
      :opvoerbaar => 100_00
    },
    "Logo's" => {
      :vat => 19_00,
      :opvoerbaar => 100_00,
      :depreciable => true
    },
    "Merken: werkzaamheden" => {
      :vat => 19_00,
      :opvoerbaar => 100_00
    },
    "Merken: merkinschrijving zelf" => {
      :vat => 0,
      :opvoerbaar => 100_00,
      :depreciable => true
    },
    "Reiskosten: algemeen" => {
      :vat => 0,
      :opvoerbaar => 100_00
    },
    "Reiskosten: treinkaartjes binnen Nederland" => {
      :vat => 6_00,
      :opvoerbaar => 100_00
    },
    "Serverhuur" => {
      :vat => 19_00,
      :opvoerbaar => 100_00
    },
    "Software" => {
      :vat => 19_00,
      :opvoerbaar => 100_00
    },
    "Uitbestede diensten" => {
      :vat => 19_00,
      :opvoerbaar => 100_00
    },
    "Verblijfskosten" => {
      :vat => 19_00,
      :opvoerbaar => 100_00
    },
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

