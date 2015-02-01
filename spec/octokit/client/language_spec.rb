require 'helper'

describe Octokit::Client::Languages do
	
  describe ".list_languages", :vcr do
    it "returns a list of languages" do
      languages = Octokit.list_languages :accept => "application/vnd.github.cypher-preview"
      expect(languages).to be_kind_of Array
    end        
  end
end # Octokit::Languages

