require 'spec_helper'

describe XContentTypeOptionsHeaderMissingHandler, vcr: {record: :all} do
  it 'returns a summary' do
    error = {
      "confidence" => "Medium",
      "wascid" => "15",
      "risk" => "Medium",
      "reference" => "http:\/\/blogs.msdn.com\/b\/ieinternals\/archive\/2010\/03\/30\/combating-clickjacking-with-x-frame-options.aspx",
      "url" => "https:\/\/micropurchase.18f.gov",
      "name" => "X-Frame-Options Header Not Set",
      "solution" => "Most modern Web browsers support the X-Frame-Options HTTP header. Ensure it's set on all web pages returned by your site (if you expect the page to be framed only by pages on your server (e.g. it's part of a FRAMESET) then you'll want to use SAMEORIGIN, otherwise if you never expect the page to be framed, you should use DENY.  ALLOW-FROM allows specific websites to frame the web page in supported web browsers).",
      "param" => "",
      "evidence" => "",
      "pluginId" => "10020",
      "other" => "At \"High\" threshold this scanner will not alert on client or server error responses.",
      "attack" => "",
      "messageId" => "8",
      "cweid" => "16",
      "alert" => "X-Frame-Options Header Not Set",
      "id" => "10",
      "description" => "X-Frame-Options header is not included in the HTTP response to protect against 'ClickJacking' attacks."
    }

    id, is_false_positive, explanation, summary = XContentTypeOptionsHeaderMissingHandler.new(error).perform

    expect(summary).to include(error['url'])
    expect(summary).to include(error['name'])
  end

  context 'given a non 400 URL' do
    describe '#perform' do
      it 'is not a false positive' do
        error = {
          "confidence" => "Medium",
          "wascid" => "15",
          "risk" => "Medium",
          "reference" => "http:\/\/blogs.msdn.com\/b\/ieinternals\/archive\/2010\/03\/30\/combating-clickjacking-with-x-frame-options.aspx",
          "url" => "https:\/\/micropurchase.18f.gov",
          "name" => "X-Frame-Options Header Not Set",
          "solution" => "Most modern Web browsers support the X-Frame-Options HTTP header. Ensure it's set on all web pages returned by your site (if you expect the page to be framed only by pages on your server (e.g. it's part of a FRAMESET) then you'll want to use SAMEORIGIN, otherwise if you never expect the page to be framed, you should use DENY.  ALLOW-FROM allows specific websites to frame the web page in supported web browsers).",
          "param" => "",
          "evidence" => "",
          "pluginId" => "10020",
          "other" => "At \"High\" threshold this scanner will not alert on client or server error responses.",
          "attack" => "",
          "messageId" => "8",
          "cweid" => "16",
          "alert" => "X-Frame-Options Header Not Set",
          "id" => "10",
          "description" => "X-Frame-Options header is not included in the HTTP response to protect against 'ClickJacking' attacks."
        }

        id, is_false_positive, explanation = XContentTypeOptionsHeaderMissingHandler.new(error).perform

        expect(is_false_positive).to be false
      end
    end
  end

  context 'give a 400 url' do
    describe '#perform' do
      it 'is a false positive' do
        error = {
          "confidence" => "Medium",
          "wascid" => "15",
          "risk" => "Medium",
          "reference" => "http:\/\/blogs.msdn.com\/b\/ieinternals\/archive\/2010\/03\/30\/combating-clickjacking-with-x-frame-options.aspx",
          "url" => "https:\/\/micropurchase.18f.gov\/sitemap.xml",
          "name" => "X-Frame-Options Header Not Set",
          "solution" => "Most modern Web browsers support the X-Frame-Options HTTP header. Ensure it's set on all web pages returned by your site (if you expect the page to be framed only by pages on your server (e.g. it's part of a FRAMESET) then you'll want to use SAMEORIGIN, otherwise if you never expect the page to be framed, you should use DENY.  ALLOW-FROM allows specific websites to frame the web page in supported web browsers).",
          "param" => "",
          "evidence" => "",
          "pluginId" => "10020",
          "other" => "At \"High\" threshold this scanner will not alert on client or server error responses.",
          "attack" => "",
          "messageId" => "8",
          "cweid" => "16",
          "alert" => "X-Frame-Options Header Not Set",
          "id" => "10",
          "description" => "X-Frame-Options header is not included in the HTTP response to protect against 'ClickJacking' attacks."
        }

        id, is_false_positive, explanation = XContentTypeOptionsHeaderMissingHandler.new(error).perform

        expect(is_false_positive).to be true
      end
    end
  end
end
