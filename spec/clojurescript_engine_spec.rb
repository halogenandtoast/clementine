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
      engine = ClojureScriptEngine.new("", "")
      opts = engine.convert_options(options)

      expect(%r{{:optimizations :advanced :output-dir \".*\" :pretty-print true}}).to match(opts)
    end

    it "should compile a file" do
      file = File.join(File.dirname(__FILE__), "support", "example.cljs")
      engine = ClojureScriptEngine.new(file)
      compiled = engine.compile
      js_context = V8::Context.new
      output = js_context.eval("#{compiled};hello.greet('wombat')")
      expect(output).to eq("Hello wombat")
    end
  end
end
