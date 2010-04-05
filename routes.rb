ActionController::Routing::Routes.draw do |map|
  map.connect ':size/:id', :controller => 'twipic', :action => 'retrieve'
  map.root :controller => "twipic", :action => 'retrieve'
end
