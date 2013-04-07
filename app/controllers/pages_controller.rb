class PagesController < ApplicationController

  layout :set_layout

  def index
  end

  def startups
  end

  def zipeople
  end

  def partners
  end

  def coworking
  end

  def contact
  end

  private

  def set_layout
    case action_name
    when 'index', 'coworking'
      'hero'
    else
    'application'
    end
  end

end
