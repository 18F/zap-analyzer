require 'spec_helper'

describe XSSProtectionNotEnabledHandler, vcr: {record: :all} do
  it 'returns a summary' do
    error = {
      "confidence" => "Medium",
      "wascid" => "14",
      "risk" => "Low",
      "reference" => "https:\/\/www.owasp.org\/index.php\/XSS_(Cross_Site_Scripting)_Prevention_Cheat_Sheet\nhttps:\/\/blog.veracode.com\/2014\/03\/guidelines-for-setting-security-headers\/",
      "url" => "https:\/\/micropurchase.18f.gov",
      "name" => "Web Browser XSS Protection Not Enabled",
      "solution" => "Ensure that the web browser's XSS filter is enabled, by setting the X-XSS-Protection HTTP response header to '1'.",
      "param" => "",
      "evidence" => "",
      "pluginId" => "10016",
      "other" => "The X-XSS-Protection HTTP response header allows the web server to enable or disable the web browser's XSS protection mechanism. The following values would attempt to enable it: \nX-XSS-Protection: 1; mode=block\nX-XSS-Protection: 1; report=http:\/\/www.example.com\/xss\nThe following values would disable it:\nX-XSS-Protection: 0\nThe X-XSS-Protection HTTP response header is currently supported on Internet Explorer, Chrome and Safari (WebKit).\nNote that this alert is only raised if the response body could potentially contain an XSS payload (with a text-based content type, with a non-zero length).",
      "attack" => "",
      "messageId" => "8",
      "cweid" => "933",
      "alert" => "Web Browser XSS Protection Not Enabled",
      "id" => "8",
      "description" => "Web Browser XSS Protection is not enabled, or is disabled by the configuration of the 'X-XSS-Protection' HTTP response header on the web server"
    }

    id, is_false_positive, explanation, summary = XSSProtectionNotEnabledHandler.new(error).perform

    expect(summary).to include(error['url'])
    expect(summary).to include(error['name'])
  end

  context 'given a non 400 URL' do
    describe '#perform' do
      it 'is not a false positive' do
        error = {
          "confidence" => "Medium",
          "wascid" => "14",
          "risk" => "Low",
          "reference" => "https:\/\/www.owasp.org\/index.php\/XSS_(Cross_Site_Scripting)_Prevention_Cheat_Sheet\nhttps:\/\/blog.veracode.com\/2014\/03\/guidelines-for-setting-security-headers\/",
          "url" => "https:\/\/micropurchase.18f.gov",
          "name" => "Web Browser XSS Protection Not Enabled",
          "solution" => "Ensure that the web browser's XSS filter is enabled, by setting the X-XSS-Protection HTTP response header to '1'.",
          "param" => "",
          "evidence" => "",
          "pluginId" => "10016",
          "other" => "The X-XSS-Protection HTTP response header allows the web server to enable or disable the web browser's XSS protection mechanism. The following values would attempt to enable it: \nX-XSS-Protection: 1; mode=block\nX-XSS-Protection: 1; report=http:\/\/www.example.com\/xss\nThe following values would disable it:\nX-XSS-Protection: 0\nThe X-XSS-Protection HTTP response header is currently supported on Internet Explorer, Chrome and Safari (WebKit).\nNote that this alert is only raised if the response body could potentially contain an XSS payload (with a text-based content type, with a non-zero length).",
          "attack" => "",
          "messageId" => "8",
          "cweid" => "933",
          "alert" => "Web Browser XSS Protection Not Enabled",
          "id" => "8",
          "description" => "Web Browser XSS Protection is not enabled, or is disabled by the configuration of the 'X-XSS-Protection' HTTP response header on the web server"
        }

        id, is_false_positive, explanation = XSSProtectionNotEnabledHandler.new(error).perform

        expect(is_false_positive).to be false
      end
    end
  end

  context 'given a 400 URL' do
    describe '#perform' do
      it 'is a false positive' do
        error = {
          "confidence" => "Medium",
          "wascid" => "14",
          "risk" => "Low",
          "reference" => "https:\/\/www.owasp.org\/index.php\/XSS_(Cross_Site_Scripting)_Prevention_Cheat_Sheet\nhttps:\/\/blog.veracode.com\/2014\/03\/guidelines-for-setting-security-headers\/",
          "url" => "https:\/\/micropurchase.18f.gov\/sitemap.xml",
          "name" => "Web Browser XSS Protection Not Enabled",
          "solution" => "Ensure that the web browser's XSS filter is enabled, by setting the X-XSS-Protection HTTP response header to '1'.",
          "param" => "",
          "evidence" => "",
          "pluginId" => "10016",
          "other" => "The X-XSS-Protection HTTP response header allows the web server to enable or disable the web browser's XSS protection mechanism. The following values would attempt to enable it: \nX-XSS-Protection: 1; mode=block\nX-XSS-Protection: 1; report=http:\/\/www.example.com\/xss\nThe following values would disable it:\nX-XSS-Protection: 0\nThe X-XSS-Protection HTTP response header is currently supported on Internet Explorer, Chrome and Safari (WebKit).\nNote that this alert is only raised if the response body could potentially contain an XSS payload (with a text-based content type, with a non-zero length).",
          "attack" => "",
          "messageId" => "8",
          "cweid" => "933",
          "alert" => "Web Browser XSS Protection Not Enabled",
          "id" => "8",
          "description" => "Web Browser XSS Protection is not enabled, or is disabled by the configuration of the 'X-XSS-Protection' HTTP response header on the web server"
        }

        id, is_false_positive, explanation = XSSProtectionNotEnabledHandler.new(error).perform

        expect(is_false_positive).to be true
      end
    end
  end
end
