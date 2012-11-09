require "./secret_checker.rb"
include SecretChecker

describe "Checking additive-ness" do

  subject { secret_is_additive_for_primes_up_to? number }

  describe "for primes up to 100" do
    let(:number) { 100 }
    let(:correct_primes) do
      [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
    end

    it "should first find the correct primes" do
      expect(primes_up_to number).to eq(correct_primes)
    end

    describe "if secret is additive" do
      before do
        def secret(x)
          x * 2
        end
      end

      it { should be_true }
    end

    describe "if secret is not additive" do
      before do
        def secret(x)
          x + 2
        end
      end

      it { should be_false }
    end
  end

  describe "with upper limit < 2" do
    let(:number) { 1 }
    
    it "should raise an error" do
      expect { subject }.to raise_error
    end
  end

  describe "with upper limit not an integer" do
    let(:number) { 45.2 }
    
    it "should raise an error" do
      expect { subject }.to raise_error
    end
  end
end