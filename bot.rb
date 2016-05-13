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

  def notify(url, project_name, language_name)
    @slack_client.chat_postMessage(
      channel: @channel,
      text: ClickbaitGenerator.get(url, project_name, language_name),
      as_user: true
    )
  end
end
