# app/controllers/inquiries_controller.rb
class InquiriesController < ApplicationController
  require 'httparty'

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.valid?
      response = generate_chatgpt_response(@inquiry.question)
      @gpt_response = response['choices'][0]['text'] if response

      # Render the view with the response
      render :new
    else
      render :new
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:question)
  end

  def generate_chatgpt_response(prompt)
    headers = {
      'Content-Type' => 'application/json',
      'Authorization' => 'DHT F7PM1reZiKiEMsc7F8DeT3BlbkFJ7H18oAlBcluBgJa0GoVc' # Replace with your API key
    }

    body = {
      prompt: prompt,
      max_tokens: 100, # Adjust token count as needed
      temperature: 0.7 # Adjust temperature as needed
    }.to_json

    response = HTTParty.post(
      'https://api.openai.com/v1/engines/davinci/completions',
      headers: headers,
      body: body
    )

    JSON.parse(response.body) if response.code == 200
  end
end
