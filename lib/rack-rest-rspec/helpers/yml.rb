require 'yaml'

def get_file(file)
  return YAML.load(File::readlines(file).join)
end
