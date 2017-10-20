require 'rails_helper'

describe BriefSummary do

  it "study should have expected brief summary" do
    nct_id='NCT02389088'
    xml=Nokogiri::XML(File.read("spec/support/xml_data/#{nct_id}.xml"))
    study=Study.new({xml: xml, nct_id: nct_id}).create
    expect(study.brief_summary.description).to include('The purpose of this study is to evaluate')
  end

end
