require 'yaml'

def get_file(file)
  YAML.load(File.readlines(file).join)
end
