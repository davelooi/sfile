require 'sinatra'

set :public_folder, Proc.new { File.join(root, 'public') }

use Rack::Auth::Basic, 'Authentication required' do |username, password|
  username == ENV.fetch('USERNAME') && password == ENV.fetch('PASSWORD')
end

get '/' do
  'Hello World!'
end
