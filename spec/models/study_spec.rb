require 'rails_helper'

describe Study do
  subject { Study.new({xml: Nokogiri::XML(File.read(Rails.root.join('spec',
                                                          'support',
                                                          'xml_data',
                                                          'example_study.xml'))), nct_id: 'NCT00002475'}).create }

  describe 'associations' do
    it { should have_one(:brief_summary).dependent(:delete) }
    it { should have_one(:design).dependent(:delete) }
    it { should have_one(:detailed_description).dependent(:delete) }
    it { should have_one(:eligibility).dependent(:delete) }
    it { should have_one(:participant_flow).dependent(:delete) }
    it { should have_one(:result_detail).dependent(:delete) }
    it { should have_one(:derived_value).dependent(:delete) }
    it { should have_one(:study_xml_record) }

    it { should have_many(:reviews).dependent(:delete_all) }
    it { should have_many(:pma_mappings) }
    it { should have_many(:pma_records).dependent(:delete_all) }
    it { should have_many(:expected_groups).dependent(:delete_all) }
    it { should have_many(:expected_outcomes).dependent(:delete_all) }
    it { should have_many(:groups).dependent(:delete_all) }
    it { should have_many(:outcomes).dependent(:delete_all) }
    it { should have_many(:baseline_measures).dependent(:delete_all) }
    it { should have_many(:browse_conditions).dependent(:delete_all) }
    it { should have_many(:browse_interventions).dependent(:delete_all) }
    it { should have_many(:conditions).dependent(:delete_all) }
    it { should have_many(:drop_withdrawals).dependent(:delete_all) }
    it { should have_many(:facilities).dependent(:delete_all) }
    it { should have_many(:interventions).dependent(:delete_all) }
    it { should have_many(:keywords).dependent(:delete_all) }
    it { should have_many(:links).dependent(:delete_all) }
    it { should have_many(:milestones).dependent(:delete_all) }
    it { should have_many(:location_countries).dependent(:delete_all) }
    it { should have_many(:outcome_measures).dependent(:delete_all) }
    it { should have_many(:overall_officials).dependent(:delete_all) }
    it { should have_many(:oversight_authorities).dependent(:delete_all) }
    it { should have_many(:reported_events).dependent(:delete_all) }
    it { should have_many(:responsible_parties).dependent(:delete_all) }
    it { should have_many(:result_agreements).dependent(:delete_all) }
    it { should have_many(:result_contacts).dependent(:delete_all) }
    it { should have_many(:secondary_ids).dependent(:delete_all) }
    it { should have_many(:sponsors).dependent(:delete_all) }
    it { should have_many(:references).dependent(:delete_all) }
  end

  describe '.create_derived_values' do
    before do
      expect(subject).to be_persisted
    end

    it 'should create a derived value record for each study' do
      Study.create_derived_values

      expect(DerivedValue.count).to eq(1)
    end
  end

end