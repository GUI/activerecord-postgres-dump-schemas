namespace :db do
  namespace :structure do
    task :set_schemas_pre_dump do
      if(defined?(ActiveRecord::Tasks::DatabaseTasks))
        config = ActiveRecord::Tasks::DatabaseTasks.current_config
      else
        config = current_config
      end

      @original_schema_search_path = config["schema_search_path"]

      search_path = case ActiveRecord::Base.dump_schemas
      when :schema_search_path
        config["schema_search_path"]
      when :all
        nil
      when String
        ActiveRecord::Base.dump_schemas
      end

      config["schema_search_path"] = search_path
    end

    task :reset_schemas_post_dump do
      if(defined?(ActiveRecord::Tasks::DatabaseTasks))
        config = ActiveRecord::Tasks::DatabaseTasks.current_config
      else
        config = current_config
      end

      config["schema_search_path"] = @original_schema_search_path
    end
  end
end

task "db:structure:dump" => "db:structure:set_schemas_pre_dump"
Rake::Task["db:structure:dump"].enhance do
  Rake::Task["db:structure:reset_schemas_post_dump"].invoke
end
