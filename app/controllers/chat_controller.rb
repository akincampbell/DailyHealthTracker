# app/controllers/chat_controller.rb

class ChatController < ApplicationController
  def ask_question
    question = params[:question]

    client = OpenAI::Client.new
    response = client.completions.create(
      engine: 'davinci', # Select the GPT-3 engine
      prompt: question,
      max_tokens: 150 # Adjust this based on your response length requirement
    )

    render json: { response: response['choices'][0]['text'] }
  end
end
