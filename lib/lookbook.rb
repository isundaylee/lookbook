require "lookbook/version"

require 'active_record'

module Lookbook
  # Your code goes here...

  require 'lookbook/product'
  require 'lookbook/style'
  require 'lookbook/category'

  class Lookbook

    def initialize(db_path, options = {})
      ActiveRecord::Base.establish_connection(
        adapter: 'sqlite3',
        database: db_path
      )

      initialize_schema
    end

    private

      def initialize_schema
        schema_version = 201312180007

        ActiveRecord::Migration.verbose = false

        if (ActiveRecord::Migrator.current_version != 0 &&
            ActiveRecord::Migrator.current_version != schema_version)
          raise 'Database schema version mismatch. '
        end

        ActiveRecord::Schema.define(version: schema_version) do |schema|

          create_table :styles do |t|
            t.string   :title
            t.float    :price
            t.float    :current_price
            t.string   :url
            t.integer  :product_id

            t.datetime :updated_at
            t.datetime :created_at
          end

          create_table :products do |t|
            t.datetime :updated_at
            t.datetime :created_at
          end

          create_table :categories do |t|
            t.string   :title
            t.integer  :parent_id

            t.datetime :updated_at
            t.datetime :created_at
          end

        end

      end

  end
end
