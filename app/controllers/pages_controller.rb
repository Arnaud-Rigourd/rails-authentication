class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
  end
  def home
  end
end
