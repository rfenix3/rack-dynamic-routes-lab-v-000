require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      #binding.pry
      item_name = req.path.split("/items/").last #turn /items/Figs into Figs
            item = @@items.find{|s| s.name == item_name}
            bindning.pry
            resp.write item.price
            resp.status = 200

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
