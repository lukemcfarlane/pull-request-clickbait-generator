require "yaml"
require "erb"

MESSAGES = YAML.load_file("./messages.yml")["messages"]

class ClickbaitGenerator
  def self.get (url, project_name, language_name, emoji = false)
    r = Random.new
    template = MESSAGES[r.rand(MESSAGES.count - 1)]
    if emoji
      template = "#{ emoji * 3 } #{ template } #{ emoji * 3 }"
    end
    ERB.new(template).result(binding)
  end
end
