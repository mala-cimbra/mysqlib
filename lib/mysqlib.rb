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

    def create(table_name, column_hash)
      createQuery = "CREATE TABLE IF NOT EXIST #{table_name}()"
      self.query(createQuery)
    end

    def drop(table_name)
      self.query("DROP TABLE #{table_name}")
    end

    
  end
end