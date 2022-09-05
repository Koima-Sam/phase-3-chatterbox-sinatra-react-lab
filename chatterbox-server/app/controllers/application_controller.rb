class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  # returns an array of all messages as JSON, ordered by created_at in ascending order.
  get '/messages' do
    Message.all.sort_by(&:created_at).to_json
  end

  #  creates a new message with a body and username from params, and returns the newly created post as JSON.
  post '/messages' do
    new_message = Message.create("body":params[:body], "username":params[:username])
    new_message.to_json
  end
# updates the body of the message using params, and returns the updated message as JSON.
  patch '/messages/:id' do
    Message.find(params[:id]).update("body":params[:body])
    Message.find(params[:id]).to_json
  end
  #  deletes the message from the database.
  delete '/messages/:id' do
    Message.find(params[:id]).destroy
  end
end
