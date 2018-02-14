class DbConfig
  def self.config
    {
      adapter: 'mysql2',
      host: ENV['DB_HOST'],
      username: ENV['DB_USERNAME'],
      password: ENV['DB_PASSWORD'],
      database: ENV['DB_NAME'],
      pool: 5,
      timeout: 5000,
      reconnect: true
    }
  end
end
