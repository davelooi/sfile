require 'sinatra'

set :public_folder, Proc.new { File.join(root, 'public') }

use Rack::Auth::Basic, 'Authentication required' do |username, password|
  username == ENV.fetch('SFILE_USERNAME') && password == ENV.fetch('SFILE_PASSWORD')
end

get '/' do
  'Hello World!'
end

post '/upload' do
  file = params[:file]
  filename = file[:filename]
  tempfile = file[:tempfile]
  File.open(File.join('public', filename), 'w') { |f| f.write tempfile.read }
  redirect '/'
end
