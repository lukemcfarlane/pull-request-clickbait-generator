require "./server"

run Proc.new { |env| Server.new.call(env) }
