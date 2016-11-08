require 'spec_helper'

describe CacheControlAndPragmaHTTPHeaderHandler, vcr: {record: :all} do
  describe '#perform' do
    it 'returns a summary' do
      error = {
        "confidence" => "Medium",
        "wascid" => "13",
        "risk" => "Low",
        "reference" => "https:\/\/www.owasp.org\/index.php\/Session_Management_Cheat_Sheet#Web_Content_Caching",
        "url" => "https:\/\/micropurchase.18f.gov/",
        "name" => "Incomplete or No Cache-control and Pragma HTTP Header Set",
        "solution" => "Whenever possible ensure the cache-control HTTP header is set with no-cache, no-store, must-revalidate, private; and that the pragma HTTP header is set with no-cache.",
        "param" => "",
        "alert" => "Incomplete or No Cache-control and Pragma HTTP Header Set",
        "pluginId" => "10015",
        "other" => "",
        "messageId" => "1",
        "cweid" => "525",
        "attack" => "",
        "id" => "0",
        "description" => "The cache-control and pragma HTTP header have not been set properly or are missing allowing the browser and proxies to cache content."
      }

      id, is_false_positive, explanation, summary = CacheControlAndPragmaHTTPHeaderHandler.new(error).perform

      expect(summary).to include(error['url'])
      expect(summary).to include(error['name'])
    end
  end

  context 'given a URL that has a 200 status code' do

    describe '#perform' do
      it 'is not a false positive' do
        error = {
          "confidence" => "Medium",
          "wascid" => "13",
          "risk" => "Low",
          "reference" => "https:\/\/www.owasp.org\/index.php\/Session_Management_Cheat_Sheet#Web_Content_Caching",
          "url" => "https:\/\/micropurchase.18f.gov/",
          "name" => "Incomplete or No Cache-control and Pragma HTTP Header Set",
          "solution" => "Whenever possible ensure the cache-control HTTP header is set with no-cache, no-store, must-revalidate, private; and that the pragma HTTP header is set with no-cache.",
          "param" => "",
          "alert" => "Incomplete or No Cache-control and Pragma HTTP Header Set",
          "pluginId" => "10015",
          "other" => "",
          "messageId" => "1",
          "cweid" => "525",
          "attack" => "",
          "id" => "0",
          "description" => "The cache-control and pragma HTTP header have not been set properly or are missing allowing the browser and proxies to cache content."
        }

        id, is_false_positive, explanation = CacheControlAndPragmaHTTPHeaderHandler.new(error).perform

        expect(is_false_positive).to be false
      end
    end
  end

  context 'given a URL that has a 404 status code' do

    describe '#perform' do
      it 'is a false positive' do
        error = {
          "confidence" => "Medium",
          "wascid" => "13",
          "risk" => "Low",
          "reference" => "https:\/\/www.owasp.org\/index.php\/Session_Management_Cheat_Sheet#Web_Content_Caching",
          "url" => "https:\/\/micropurchase.18f.gov/faq",
          "name" => "Incomplete or No Cache-control and Pragma HTTP Header Set",
          "solution" => "Whenever possible ensure the cache-control HTTP header is set with no-cache, no-store, must-revalidate, private; and that the pragma HTTP header is set with no-cache.",
          "param" => "",
          "alert" => "Incomplete or No Cache-control and Pragma HTTP Header Set",
          "pluginId" => "10015",
          "other" => "",
          "messageId" => "1",
          "cweid" => "525",
          "attack" => "",
          "id" => "0",
          "description" => "The cache-control and pragma HTTP header have not been set properly or are missing allowing the browser and proxies to cache content."
        }

        id, is_false_positive, explanation = CacheControlAndPragmaHTTPHeaderHandler.new(error).perform

        expect(is_false_positive).to be true
      end
    end
  end
end
