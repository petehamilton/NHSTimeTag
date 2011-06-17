class ClinicsController < ApplicationController
  def index
    
  end
  def status
    respond_to do |format|
      format.json{
        render :json => @clinic.to_json
      }
    end
  end
end