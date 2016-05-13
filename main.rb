require "thor"
require "./bot"

class Notifier < Thor
  desc "notify", "Notify a Slack channel about a pull request with a randomly-generated clickbait message."
  method_option :channel, :aliases => "-c", :desc => "Specify the Slack channel"
  method_option :url, :aliases => "-u", :desc => "Specify the pull request URL"
  method_option :project, :aliases => "-p", :desc => "Specify the project name (used to generate message)"
  method_option :language, :aliases => "-l", :desc => "Specify the language/framework name (used to generate message)"
  def notify
    bot = Bot.new(options[:channel])
    bot.notify(options[:url], options[:project], options[:language])
  end
end

Notifier.start
