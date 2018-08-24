class BallsController < ApplicationController
  def create
    @color = color(params[:balls_count].to_i + 1)
    respond_to do |format|
      format.js
    end
  end

  private

  def color(count)
    return 'purple' if count % 15 == 0
    return 'green'  if count % 3  == 0
    return 'blue'   if count % 5  == 0
    return 'pink'
  end
end
