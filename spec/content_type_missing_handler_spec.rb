require 'spec_helper'

describe ContentTypeMissingHandler, vcr: {record: :all} do
  context 'given a non OAuth redirect URL' do
    describe '#perform' do
      it 'is not a false positive' do
        error =  {
          "confidence" => "Medium",
          "wascid" => "12",
          "risk" => "Low",
          "reference" => "http:\/\/msdn.microsoft.com\/en-us\/library\/ie\/gg622941%28v=vs.85%29.aspx",
          "url" => "https:\/\/micropurchase.18f.gov",
          "name" => "Content-Type Header Missing",
          "solution" => "Ensure each page is setting the specific and appropriate content-type value for the content being delivered.",
          "param" => "",
          "evidence" => "",
          "pluginId" => "10019",
          "other" => "",
          "attack" => "",
          "messageId" => "35",
          "cweid" => "345",
          "alert" => "Content-Type Header Missing",
          "id" => "15",
          "description" => "The Content-Type header was either missing or empty."
        }

        id, is_false_positive, explanation = ContentTypeMissingHandler.new(error).perform

        expect(is_false_positive).to be false
      end
    end
  end

  context 'given a GitHub OAuth redirect URL' do
    describe '#perform' do
      it 'is a false positive' do
        error =  {
          "confidence" => "Medium",
          "wascid" => "12",
          "risk" => "Low",
          "reference" => "http:\/\/msdn.microsoft.com\/en-us\/library\/ie\/gg622941%28v=vs.85%29.aspx",
          "url" => "https:\/\/micropurchase.18f.gov\/auth\/github",
          "name" => "Content-Type Header Missing",
          "solution" => "Ensure each page is setting the specific and appropriate content-type value for the content being delivered.",
          "param" => "",
          "evidence" => "",
          "pluginId" => "10019",
          "other" => "",
          "attack" => "",
          "messageId" => "35",
          "cweid" => "345",
          "alert" => "Content-Type Header Missing",
          "id" => "15",
          "description" => "The Content-Type header was either missing or empty."
        }

        id, is_false_positive, explanation = ContentTypeMissingHandler.new(error).perform

        expect(is_false_positive).to be true
      end
    end
  end
end
