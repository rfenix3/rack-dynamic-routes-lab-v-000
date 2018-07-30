require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      #binding.pry
      item_name = req.path.split("/items/").last #turn /items/Figs into Figs
          if item.nil?
            resp.write "Item not found."
            resp.status = 200
          else
            item = @@items.find{|s| s.name == item_name}
            binding.pry
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
