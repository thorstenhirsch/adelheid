describe Extractable do
  describe "#extract_to" do

    before(:each) {
      @xml = <<-EOF
        <?xml version="1.0"?>
        <deployment>
          <foo>Hello</foo>
          <bar>World</bar>
          <attribute>This is Sparta</attribute>
          <attributes>
            <foo>EncoreUnFoo</foo>
            <lorem>ipsum</lorem>
          </attributes>
        </deployment>
      EOF
      @json = <<-EOF
        deployment:
          foo: Hello
          bar: World
          attribute: This is Sparta
          attributes:
            foo: EncoreUnFoo
            lorem: ipsum
      EOF
    }

    let(:deployment_mongo) {}

    context "simple attribute, no xpath, found" do
      it { expect(@strategy.analyze_quote(yb100a101)).to eq [] }
    end

    context "simple attribute, no xpath, not found" do
      it { expect(@strategy.analyze_quote(yb103a105)).to eq [] }
    end

    context "simple xpath, found" do
      it { expect(@strategy.analyze_quote(yb100a101)).to eq [] }
    end

    context "simple xpath, not found" do
      it { expect(@strategy.analyze_quote(yb103a105)).to eq [] }
    end

    context "xpath with concat, found" do
      it { expect(@strategy.analyze_quote(yb100a101)).to eq [] }
    end

    context "invalid xpath, not found" do
      it { expect(@strategy.analyze_quote(yb103a105)).to eq [] }
    end

    context "xpath with referenced attribute, found" do
      it { expect(@strategy.analyze_quote(yb100a101)).to eq [] }
    end

    context "xpath found, referenced attribute not found" do
      it { expect(@strategy.analyze_quote(yb103a105)).to eq [] }
    end

    context "no attributes found" do
      it { expect(@strategy.analyze_quote(yb100a101)).to eq [] }
    end

    context "one attributes found" do
      it { expect(@strategy.analyze_quote(yb100a101)).to eq [] }
    end

    context "two attributes found" do
      it { expect(@strategy.analyze_quote(yb100a101)).to eq [] }
    end

  end
end
