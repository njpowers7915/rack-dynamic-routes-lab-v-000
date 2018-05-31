class Application
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split('/items').last
      if @@items.find {|i| i.name == item_name} == false
        resp.write "We don't have that item"
        resp.status = 400
      else
        item = @@items.find {|i| i.name == item_name}
        resp.write "#{item.price}"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end