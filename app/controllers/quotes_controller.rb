require 'unirest'
class QuotesController < ApplicationController
    # skip_before_action :verify_authenticity_token

    before_action :find_quote, only: [:show, :update, :destroy]
    
    def index
        quotes = Quote.all
        render json: quotes, except: [:created_at, :updated_at]
    end

    def show
        render json: @quote, except: [:created_at, :updated_at]
    end

    def new
        quote = Quote.new

    end

    def create
        quote = Quote.create(quote_params)
        render json: quote

    end

        # call api to get text sentiment from
        # update the sentiment and save value

    def update
        quote = Quote.find(params[:id])
            response = Unirest.post "https://twinword-sentiment-analysis.p.rapidapi.com/analyze/",
        headers:{
            "X-RapidAPI-Host" => "twinword-sentiment-analysis.p.rapidapi.com",
            "X-RapidAPI-Key" => "f8988f3300msh1bf9aec476d3e6fp11f826jsn5bb5ceaa92d7",
                "Content-Type" => "application/x-www-form-urlencoded"
  },
  parameters:{
    "text" => quote.text
  }
        # puts response.body["type"]

        @quote.update(
            saved: params[:saved],
            sentiment: response.body["type"]
        )
        @quote.save
    end

    def destroy
        @quote.destroy
        render json: {message: "quote deleted"}
    end



    private

        def find_quote
           @quote = Quote.find(params[:id])
        end

        def quote_params
            params.require(:quote).permit(:text, :author, :sentiment)
        end
end
