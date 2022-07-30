#!/usr/bin/env ruby
# example
# ./gen_dockerfile.rb <distro name (bullseye, jammy etc)> <h2o tag (optional, set 'master' if not passed)>

require 'erb'
require 'yaml'
require 'logger'

if ARGV.size < 1
  warn "Insufficent arguments. Usage: ./gen_dockerfile.rb <distro name> <h2o tag (optional)>"
end

dockerfile_template = ERB.new(File.read('Dockerfile.erb'), trim_mode: '-')
build_data = YAML.load_file('build.yaml', symbolize_names: true)
logger = Logger.new(STDOUT)
ALL = ARGV[0] == "--all"

def get_h2o_branches(h2o_tag, tag_list)
  return tag_list if ALL
  return [h2o_tag] if tag_list.include?(h2o_tag)
  return ["master"]
end

build_data[:build][:distributions].each do |distro, versions|
  versions.each do |version|
    unless ALL
      next if !(version == ARGV[0])
    end

    build_distribution = version
    execute_distribution = "#{distro}:#{version}"
    branches = get_h2o_branches(ARGV[1], build_data[:build][:versions])

    branches.each do |branch|
      dockerfile = dockerfile_template.result(binding)
      filename = "Dockerfile.#{version}_#{branch}"
      File.open(filename, 'w', 0644) { |f| f.write(dockerfile) }
      logger.info "Created #{filename}"
    end
  end
end
