require 'httparty'
require 'nokogiri'
require 'active_support/all'

module Display_Stock_Price
	response = HTTParty.get('http://finance.yahoo.com/q?s=AAPL')

	dom = Nokogiri::HTML(response.body)

	ticker_span = dom.xpath("//span[@id='yfs_l84_aapl']")

	price = ticker_span.children[0].content.to_f.to_s(:currency)
	"Apple's current stock price is #{price}"
end