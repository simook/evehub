require 'rubygems'
require 'faraday'
require 'nokogiri'

class Eve

  def self.APIKeyInfo(id,key)
    conn = Faraday.new(:url => 'https://api.eveonline.com') do |faraday|
      faraday.request  :url_encoded
      faraday.adapter  Faraday.default_adapter
    end
    response = conn.get '/account/APIKeyInfo.xml.aspx',{:keyid => id,:vcode => key}
    case response.status
    when 200
      # Nothing
    else
      raise EAAL::Exception::HTTPError.new("An HTTP Error occured, body: " + response.body)
    end
    xml = response.body

    if xml
      eaal = Hpricot.XML(xml)
      mask = Nokogiri::XML(xml)

      keyinfo = {}
      keyinfo['characters'] = EAAL::Result.new('APIKeyInfo', eaal).key.characters
      keyinfo['accessmask'] = mask.xpath("//*[@accessMask]").first.attr('accessMask')
      keyinfo
    end
  end
end