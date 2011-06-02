# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :cli => "-c -f doc", :version => 2 do
  watch(%r{^spec/.+_spec\.rb})
  watch(%r{^lib/(.+)\.rb})     { |m| "spec/#{m[1]}_spec.rb" }
end
