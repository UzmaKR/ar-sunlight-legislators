require 'csv'
require_relative '../db/config'
require_relative '../app/models/politician'

class SunlightLegislatorsImporter < ActiveRecord::Base
  def self.import(filename)

    CSV.foreach(filename, headers: true, :header_converters => :symbol) do |row|
      Politician.new(row.to_hash).save
    end
  end
end
