require 'string'

describe String do

  let(:plaintext) { 'Hello world.' }
  let(:spintext) { 'Find this. {Hello|Hi} to the {{world|worlds} out there|planet}{!|.|?} Cool.' }
  let(:spintax_pattern) { /{[^{}]*}/ }

  describe "calling unspin" do
    
    describe "on plaintext" do
      expect { plaintext.unspin }.not_to change(plaintext)

      subject(:result) { plaintext.unspin }
      expect(result).to eq(plaintext)
    end

    describe "on spintext" do
      expect { spintext.unspin }.not_to change(spintext)

      subject(:result) { spintext.unspin }
      it { should_not == spintext }
      it { should_not =~ spintax_pattern }
    end
  end

  describe "calling unspin!" do
    
    describe "on plaintext" do
      expect { plaintext.unspin! }.not_to change(plaintext)

      subject(:result) { plaintext.unspin! }
      expect(result).to eq(nil)
    end

    describe "on spintext" do
      expect { spintext.unspin! }.to change(spintext)

      let(:original) { spintext.dup }
      before { spintext.unspin! }
      subject { spintext }
      it { should_not == original }
      it { should_not =~ spintax_pattern }
    end
  end
end