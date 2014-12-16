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

    def create(table_name, )
      self.query()
    end
  end

end