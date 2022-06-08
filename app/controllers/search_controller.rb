class SearchController < ApplicationController
  def search
    @query = MovieIndex.search(params[:query])
    @query = @query.where(rating_avg: 6..10)
    @query = @query.sort(rating_avg: :desc)
    @query = @query.page(params[:page]).per(50)
    
    # return an array of ActiveRecord#Movie objects
    @results = @query.records

    @total_results = @query.total_entries
  end
end
