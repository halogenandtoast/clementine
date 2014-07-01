require 'fileutils'

EXT_DIR = File.dirname(__FILE__)
ROOT_DIR = File.join(EXT_DIR, "..")
CLOJURESCRIPT_HOME = File.join(File.dirname(__FILE__), "clojure-clojurescript")

def is_git_repo?
  File.exists?(File.join(ROOT_DIR, ".git"))
end

$stdout.puts "Bootrapping ClojureScript"

Dir.chdir(EXT_DIR) do
  File.open("./Makefile", "w") do |file|
    file.puts <<-MAKEFILE
all:
\t@echo "Done"
install:
\t@echo
    MAKEFILE
  end

  if File.exists?("clojure-clojurescript")
    FileUtils.rm_rf "./clojure-clojurescript"
  end

  if is_git_repo?
    Dir.chdir(ROOT_DIR) do
      %x(git submodule add https://github.com/clojure/clojurescript.git ext/clojure-clojurescript)
      %x(git submodule init)
      %x(git submodule update)
    end
  else
    %x(git clone https://github.com/clojure/clojurescript.git clojure-clojurescript)
  end
end

Dir.chdir(CLOJURESCRIPT_HOME) do
  %x(./script/bootstrap)
  FileUtils.rm_rf File.join('./closure')
end


