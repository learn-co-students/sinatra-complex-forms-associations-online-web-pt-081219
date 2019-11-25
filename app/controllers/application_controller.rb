class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, proc { File.join(root, "../views/") }
  
  # get '/' do
  #   erb :"owners/new"
  # end
end
