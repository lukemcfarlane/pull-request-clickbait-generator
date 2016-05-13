Pull Request Clickbait Notifier
===============================

Generates clickbait messages in order to notify people on Slack about pull requests.

```
Usage:
  main.rb notify

Options:
  -c, [--channel=CHANNEL]    # Specify the Slack channel
  -u, [--url=URL]            # Specify the pull request URL
  -p, [--project=PROJECT]    # Specify the project name (used to generate message)
  -l, [--language=LANGUAGE]  # Specify the language/framework name (used to generate message)

Notify a Slack channel about a pull request with a randomly-generated clickbait message.
```
