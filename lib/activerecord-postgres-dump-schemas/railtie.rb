require "rails"
require "active_record"

class ActiveRecord::Base
  mattr_accessor :dump_schemas, instance_writer: false
  self.dump_schemas = :schema_search_path
end

module ActiveRecordPostgresDumpSchemas
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load File.expand_path("../tasks/db.rake", __FILE__)
    end
  end
end
