require "slack-ruby-client"
require "./clickbait-generator"

class Bot
  def initialize(channel)
    @channel = channel
    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
    end
    @slack_client = Slack::Web::Client.new
    @slack_client.auth_test
  end

  def notify(url, project_name, language_name, emoji)
    message = ClickbaitGenerator.get(url, project_name, language_name, emoji)
    @slack_client.chat_postMessage(
      channel: @channel,
      text: message
    )
    message
  end
end
