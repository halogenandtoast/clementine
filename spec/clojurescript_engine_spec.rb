require "spec_helper"
require "clementine/clojurescript_engine"

module Clementine
  describe ClojureScriptEngine do

    it "should have default options" do
      engine = Clementine::ClojureScriptEngine.new("", "")
      expect(engine.default_opts).not_to be_nil
    end

    it "should allow optimizations" do
      options = {:optimizations => :advanced,  :output_dir => "#{Dir.pwd}", :pretty_print => true}
      engine = Clementine::ClojureScriptEngine.new("", "")
      opts = engine.convert_options(options)

      expect(%r{{:optimizations :advanced :output-dir \".*\" :pretty-print true}}).to match(opts)
    end
  end
end
