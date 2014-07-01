require "spec_helper"
require "clementine/options"

module Clementine
  describe "options" do

    it "sets output options" do
      expect("output-dir").to eq(Clementine.ruby2clj("output_dir"))
      expect("output-to").to eq(Clementine.ruby2clj("output_to"))
    end
  end
end
