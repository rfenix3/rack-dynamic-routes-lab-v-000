require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      item_name = req.path.split("/items/").last #turn /items/Figs into Figs
      item = @@items.find{|s| s.name == item_name}
      if item.nil?
        resp.write "Item not found."
        resp.status = 400
      else
        #binding.pry
        resp.write item.price
        resp.status = 200
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
