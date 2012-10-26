require "bundler/gem_tasks"

scripts = {
  "https://github.com/jeremyruppel/underscore.inflection" => "https://raw.github.com/jeremyruppel/underscore.inflection/master/src/underscore.inflection.js",
  "https://github.com/epeli/underscore.string" => "https://raw.github.com/epeli/underscore.string/master/lib/underscore.string.js",
  "https://github.com/timrwood/moment/" => "https://raw.github.com/timrwood/moment/master/moment.js",
  "http://josscrowcroft.github.com/accounting.js/" => "https://raw.github.com/josscrowcroft/accounting.js/master/accounting.js",
  "https://github.com/PaulUithol/Backbone-relational" => "https://raw.github.com/PaulUithol/Backbone-relational/master/backbone-relational.js",
  "https://github.com/theironcook/Backbone.ModelBinder" => "https://raw.github.com/theironcook/Backbone.ModelBinder/master/Backbone.ModelBinder.js"
}

require 'open-uri'
desc "Update scripts"
task :update_scripts do
  dir = File.expand_path("../vendor/assets/javascripts/chiropractor", __FILE__)
  FileUtils.mkdir_p(dir)
  scripts.each do |repo_url, file_url|
    file = File.basename(URI.parse(file_url).path)
    output = File.join(dir,file)
    File.open(output, "w+"){|f| f.write(open(file_url).read)}
  end  
end