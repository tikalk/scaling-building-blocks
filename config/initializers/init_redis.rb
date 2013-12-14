require "redis"

$redis = Redis.new(host: '192.168.99.50', port: 6379)

# init redis-objects
Redis.current = $redis