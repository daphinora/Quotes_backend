class QuoteCollectionsController < ApplicationController


    def index
        quotecollections = QuoteCollection.all
        render json: quotecollections, except: [:created_at, :updated_at]
    end

    def show
        render json: @quotecollection, except: [:created_at, :updated_at]
    end

    


end
