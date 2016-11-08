require 'spec_helper'

describe CrossDomainJavascriptHandler, vcr: {record: :all} do
  context 'given a whitelisted URL' do
    describe '#perform' do
      it 'is a false positive' do
        error = {
          "confidence" => "Medium",
          "wascid" => "15",
          "risk" => "Low",
          "reference" => "",
          "url" => "https:\/\/micropurchase.18f.gov",
          "name" => "Cross-Domain JavaScript Source File Inclusion",
          "solution" => "Ensure JavaScript source files are loaded from only trusted sources, and the sources can't be controlled by end users of the application.",
          "param" => "\/\/ajax.googleapis.com\/ajax\/libs\/jquery\/1.12.4\/jquery.min.js",
          "evidence" => "\/\/ajax.googleapis.com\/ajax\/libs\/jquery\/1.12.4\/jquery.min.js",
          "pluginId" => "10017",
          "other" => "",
          "attack" => "",
          "messageId" => "1",
          "cweid" => "829",
          "alert" => "Cross-Domain JavaScript Source File Inclusion",
          "id" => "1",
          "description" => "The page includes one or more script files from a third-party domain."
        }

        id, is_false_positive, explanation = CrossDomainJavascriptHandler.new(error).perform

        expect(is_false_positive).to be true
      end
    end
  end

  context 'given a non-whitelisted URL' do
    describe '#perform' do
      it 'is not a false positive' do
        error = {
          "confidence" => "Medium",
          "wascid" => "15",
          "risk" => "Low",
          "reference" => "",
          "url" => "https:\/\/micropurchase.18f.gov",
          "name" => "Cross-Domain JavaScript Source File Inclusion",
          "solution" => "Ensure JavaScript source files are loaded from only trusted sources, and the sources can't be controlled by end users of the application.",
          "param" => "\/\/ajax.evil-code.com\/ajax\/libs\/jquery\/1.12.4\/jquery.min.js",
          "evidence" => "\/\/ajax.evil-code.com\/ajax\/libs\/jquery\/1.12.4\/jquery.min.js",
          "pluginId" => "10017",
          "other" => "",
          "attack" => "",
          "messageId" => "1",
          "cweid" => "829",
          "alert" => "Cross-Domain JavaScript Source File Inclusion",
          "id" => "1",
          "description" => "The page includes one or more script files from a third-party domain."
        }

        id, is_false_positive, explanation = CrossDomainJavascriptHandler.new(error).perform

        expect(is_false_positive).to be false
      end
    end
  end
end
