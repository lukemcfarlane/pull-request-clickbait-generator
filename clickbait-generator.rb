require "yaml"
require "erb"

MESSAGES = YAML.load_file("./messages.yml")["messages"]

class ClickbaitGenerator
  def self.get (url, project_name, language_name)
    r = Random.new
    template = MESSAGES[r.rand(MESSAGES.count - 1)]
    ERB.new(template).result(binding)
  end
end
