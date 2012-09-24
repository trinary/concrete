require File.expand_path('../config/app', __FILE__)

class App < Sinatra::Base
  set :root, File.expand_path('../', __FILE__)
  set :sprockets, Sprockets::Environment.new(root)
  set :precompile, [/\w+\.(?!js|css).+/, /applcation.(css|js)$/]
  set :precomile, [/.*/]
  set :assets_prefix, 'assets'
  set :assets_path, File.join(root, 'public', assets_prefix)
  set :assets_path, File.join(root, 'vendor', assets_prefix)

  configure do
    sprockets.append_path(File.join(root, 'assets', 'javascripts'))
    sprockets.append_path(File.join(root, 'assets', 'stylesheets'))
    sprockets.append_path(File.join(root, 'vendor', 'assets', 'javascripts'))
    sprockets.append_path(File.join(root, 'vendor', 'assets', 'stylesheets'))
    sprockets.append_path File.expand_path('assets/images', settings.root)

    sprockets.context_class.instance_eval do
      include AssetHelpers
    end
  end

  helpers do
    include AssetHelpers
  end

  mime_type :arraybuffer, 'arraybuffer'

  get '/' do
    haml :index
  end

  get '/audio' do
    content_type :json
    {
      :beats_href => 'audio/beats/', 
      :items => Dir.entries('audio/beats').select { |filename| filename =~ /\w+.mp3/ }
    }.to_json
  end

  get '/audio/beats' do
    content_type :json

  end

  get '/audio/beats/:filename' do
    content_type :arraybuffer

    send_file "audio/beats/#{params[:filename]}"
  end

  get '/audio/*.mp3' do
    mime_type :arraybuffer, 'arraybuffer'
  end
end
