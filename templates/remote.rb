REPOSITORY = "git://github.com/tsechingho/authlogic_bundle.git"
REMOTE_SOURCE = "http://github.com/tsechingho/authlogic_bundle/raw/master"
SOURCE = "vendor/plugins/authlogic_bundle"

load_template("#{REMOTE_SOURCE}/templates/helper.rb")

load_template("#{REMOTE_SOURCE}/templates/git_init.rb") if git?

run "ln -s #{ENV['EDGE_RAILS']} vendor/rails" if edge_rails?

plugin 'authlogic_bundle', :submodule => git?, :git => REPOSITORY

load_template("#{SOURCE}/templates/base.rb")

if yes?("Do you want to include bundled testing suit? (y/n)")
  load_template("#{SOURCE}/templates/testing.rb")
end

if yes?("Do you want to include bundled monitor suit? (y/n)")
  load_template("#{SOURCE}/templates/monitor.rb")
end
