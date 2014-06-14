class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    #puts "INCOMING PARAMS HERE: #{params}"

    # You put the message-splitting and business
    # magic here. 

    user = User.find_by(email: params[:sender])
    subject = params[:Subject]
    content = params[:'body-plain']

    topics = []

    subject.scan(/\B#([^,\#]+)/).each do |topic|
      topics.push(Topic.find_or_create_by(name: topic[0].to_s.downcase))
    end

    Rails.logger.info ">>>>>>>>>>>>>> USER: #{user.inspect} <<<<<<<<<<<<<<<<<<<<<<"
    Rails.logger.info ">>>>>>>>>>>>>> CONTENT HERE: #{content} <<<<<<<<<<<<<<<<<<<"

    # Assuming all went well. 
    head 200
  end
end