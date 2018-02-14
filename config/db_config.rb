class DbConfig
  def self.config
    {
      adapter: 'mysql2',
      host: 'localhost',
      username: 'root',
      password: '********',
      database: 'student_details_db',
      pool: 5,
      timeout: 5000,
      reconnect: true
    }
  end
end
