#!/usr/bin/env ruby
require 'mysql2'

module Mysqlib

  class Mysqlib
    def initialize(host, username, password, port, database, read_timeout, write_timeout, connect_timeout)
      @host = host
      @username = username
      @password = password
      @port = port
      @database = database
      @read_timeout = read_timeout
      @write_timeout = write_timeout
      @connect_timeout = connect_timeout
    end

    def connect()
      Mysql2::Client.new(
        :host => @host,
        :username => @username,
        :password => @password,
        :port => @port,
        :database => @database,
        :read_timeout => @read_timeout,
        :write_timeout => @write_timeout,
        :connect_timeout => @connect_timeout,
        )
    end

    def create(table_name, colonna_hash)
      createQuery = "CREATE TABLE IF NOT EXIST #{table_name}()"
      self.query(createQuery)
    end

    def insert(table_name, campi_hash)
      createQuery = "INSERT INTO #{table_name}(#{campi_hash.keys.join(", ")}) VALUES (#{campi_hash.values.join(", ")})"
      self.query(createQuery)
    end

    def update(table_name, campo_update_hash, campo_select_hash)

      createQuery = "UPDATE #{table_name} SET #{campo_update_hash.keys.join} = #{campo_update_hash.values.join} WHERE "
      self.query(createQuery)
    end

    def drop(table_name)
      self.query("DROP TABLE #{table_name}")
    end

    def select_all(table_name)
      self.query("SELECT * FROM #{table_name}")
    end
    
  end
end