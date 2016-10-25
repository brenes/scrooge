class SentencesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create

    received = FantasticRobot::Model::Update.new(JSON.parse(request.body.read))

    response = FantasticRobot::Request::SendMessage.new({
      chat_id: received.message.chat.id,
      text: "Hi! #{received.message.from.username}!",
      reply_to_message_id: received.message.message_id
    })

    render json: response

  end

end
