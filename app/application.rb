class Application
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split('/items').last
      item = @@items.find{|i| i.name == item_name}
      if @@items.include(item)
        resp.write "#{item.price}"
      else
        resp.write "We don't have that item"
        resp.status = 400
      else
        
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    
    resp.finish
  end
end