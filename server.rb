require "json"
require "./bot"

HEADERS = { "Content-Type" => "application/json" }

class Server
  def call (env)
    if env["REQUEST_METHOD"] == "POST"
      return post(env)
    else
      body = JSON.generate(error: "Method not supported")
      return [ "405", HEADERS, [body] ]
    end
  end

  def post (env)
    req = Rack::Request.new(env)
    status = 200
    if env["HTTP_AUTHORIZATION"] == "Basic #{ENV["AUTH_TOKEN"]}"
      begin
        json_body = JSON.parse(req.body.read)
        bot = Bot.new(json_body["channel"])
        message = bot.notify(
          json_body["url"],
          json_body["project"],
          json_body["language"],
          json_body["emoji"]
        )
        body = JSON.generate(
          success: true,
          message: message,
          channel: json_body["channel"]
        )
      rescue => error
        status = 500
        body = JSON.generate(
          success: false,
          error: "#{error.class}: #{error}"
        )
      end
    else
      status = 401
      body = JSON.generate(
        success: false,
        error: "Unauthorized"
      )
    end
    [ status, HEADERS, [body] ]
  end
end
