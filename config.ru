require "rack/cors"
require "./server"

run Proc.new { |env| Server.new.call(env) }

use Rack::Cors do
  allow do
    origins "*"
    resource '*',
        :headers => :any,
        :methods => [:get, :post, :delete, :put, :options]
  end
end
