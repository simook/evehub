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
      xml = Nokogiri::XML(response.body)
      if (xml/"eveapi/error").length > 0
        error = (xml/"eveapi/error").first
        raise EAAL::Exception.raiseEveAPIException(error["code"], error.inner_html)
      end
      if (xml/"eveapi/result").length < 1
        raise EAAL::Exception::EAALError.new("Unknown API error, no result element was found")
      end
      xml.xpath("//*[@accessMask]").first.attr('accessMask')
    end
  end
end