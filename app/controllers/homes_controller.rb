class HomesController < ApplicationController
  def index
    @cities = JSON.parse(File.read(Rails.root.join('db/tinh_tp.json')))
    @partners = Partner.all
  end

  def get_district
    city_code = params['city_code']
    @districts = JSON.parse(File.read(Rails.root.join('db/quan-huyen/' + city_code + '.json')))
    district_html = '<option selected="selected" value="default">-- Choose district --</option>'
    @districts.each do |district|
      district_html += '<option value="' + district[0] + '">' + district[1]['name_with_type'] + '</option>'
    end
    render json: { data: district_html }
  end
end
