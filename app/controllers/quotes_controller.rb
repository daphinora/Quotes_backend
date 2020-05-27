class QuotesController < ApplicationController
    # skip_before_action :verify_authenticity_token

    # before_action :find_quote, only: [:show, :update]
    
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


    private

        def find_quote
           @quote = quote.find(params[:id])
        end

        def quote_params
            params.require(:quote).permit(:text, :author, :sentiment)
        end
end
