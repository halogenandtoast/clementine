require 'fileutils'

EXT_DIR = File.dirname(__FILE__)
CLOJURESCRIPT_HOME = File.join(File.dirname(__FILE__), "clojure-clojurescript")

$stdout.puts "Bootrapping ClojureScript"

Dir.chdir(EXT_DIR) do
  unless File.exists?("clojure-clojurescript")
    %x(git clone https://github.com/clojure/clojurescript.git clojure-clojurescript)
  end
end

Dir.chdir(CLOJURESCRIPT_HOME) do
  %x(./script/bootstrap)
  FileUtils.rm_rf File.join('./closure')
end
