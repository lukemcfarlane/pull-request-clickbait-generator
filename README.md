Pull Request Clickbait Notifier
===============================

Generates clickbait pull request notifications and posts them on Slack.

### Example

```
export SLACK_API_TOKEN=xxxx-xxxxxxxxxx-xxxxxxxxxx-xxxxxxxxxxx-xxxxxxxxxx
ruby main.rb notify -c "#channel" -u "https://github.com/my-username/my-project/pulls/17" -p "My Project" -l "Ruby"
```

Will post a message like the following to the Slack channel #channel:
> This pull request will prove that you have been writing Ruby wrong your whole life: https://github.com/my-username/my-project/pulls/17

or

> This pull request will change the way you think about My Project: https://github.com/my-username/my-project/pulls/17"


### Usage

```
Usage:
  main.rb notify

Options:
  -c, [--channel=CHANNEL]    # Specify the Slack channel
  -u, [--url=URL]            # Specify the pull request URL
  -p, [--project=PROJECT]    # Specify the project name (used to generate message)
  -l, [--language=LANGUAGE]  # Specify the language/framework name (used to generate message)
  -e, [--emoji=EMOJI]        # Specify an emoji to be used to generate the message

Notify a Slack channel about a pull request with a randomly-generated clickbait message.
```
