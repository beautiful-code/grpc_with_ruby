# frozen_string_literal: true
require './config/db_config'

namespace :db do
  def establish_connection
    ActiveRecord::Base.establish_connection(DbConfig.config)
  end

  def establish_admin_connection
    admin_connection = DbConfig.config.merge('database' => 'mysql')
    ActiveRecord::Base.establish_connection(admin_connection)
  end

  desc 'Create a database'
  task :create do
    establish_admin_connection
    ActiveRecord::Base.connection.create_database(DbConfig.config.fetch(:database))
    Rake::Task['db:update_schema'].invoke
  end

  desc 'Drop database'
  task :drop do
    establish_admin_connection
    ActiveRecord::Base.connection.drop_database(DbConfig.config.fetch(:database))
  end

  desc 'Update Schema'
  task :update_schema do
    establish_connection
    ActiveRecord::SchemaDumper.dump(
      ActiveRecord::Base.connection,
      File.new('./db/schema.rb', 'w')
    )
  end

  desc 'Migrate the database'
  task :migrate do
    establish_connection
    ActiveRecord::Migrator.migrate('db/migrate/')
    Rake::Task['db:update_schema'].invoke
    puts 'Database migrated.'
  end

  desc 'Rollback the previous migration'
  task :rollback do
    establish_connection
    ActiveRecord::Migrator.rollback('db/migrate/')
    Rake::Task['db:update_schema'].invoke
    puts 'Migration rolledback'
  end
end

namespace :g do
  desc 'Generate migration'
  task :migration do
    name = ARGV[1] || raise('Specify name: rake g:migration your_migration')
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    path = File.expand_path(
      "../../../db/migrate/#{timestamp}_#{name}.rb",
      __FILE__
    )
    migration_class = name.split('_').map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<~EOF
class #{migration_class} < ActiveRecord::Migration[#{ActiveRecord.version.to_s.split('.')[0..1].join(".")}]
  def change
  end
end
      EOF
    end

    puts "Migration #{path} created"
    abort # needed stop other tasks
  end
end
