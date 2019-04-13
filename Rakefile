PATH = File.expand_path "."

def cwd(dir)
  Dir.chdir "#{PATH}/#{dir}"
end

desc "run"
task :run do
  cwd "app"
  sh "bundle exec rake"
end

task default: :run
