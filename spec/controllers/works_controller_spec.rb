require 'spec_helper'

describe WorksController do
  context '#update' do
    it 'updates the work' do
      pending("waiting for Rails 4 RSpec update to work")
      # http://stackoverflow.com/questions/12497897/testing-json-api-in-rails-3-2-using-rspec-using-exact-put-post-bodies-as-backbon
      notice = create(:dmca)
      work = notice.works.last
      #Content Type Header
      #Authentication Token Header
      json = '{ "work": {"description":"it works!", "infringing_urls_attributes":[{"url": "http://cyber.law.harvard.edu"}, {"url": "http://www.digg.com"}]} }'.to_json
      put :update, id: work.id, format: :json, work: json
      expect(response).to be_successful
    end
  end
end
