
docker build -f Dockerfile.315 -t php-memcached-cli:3.1.5-1.0.18 .

docker build -f Dockerfile.320 -t php-memcached-cli:3.2.0-1.0.18 .

# Start memcached server, if not already running
docker run --rm -d --name memcached -p 11211:11211 memcached:1.5.6 || true

echo "######### TESTING 3.1.5 ##########"
docker run -it --rm --link memcached:memcached php-memcached-cli:3.1.5-1.0.18 php /memtest.php

echo "######### TESTING 3.2.0 ##########"
docker run -it --rm --link memcached:memcached php-memcached-cli:3.2.0-1.0.18 php /memtest.php

# Stop memcached server
docker stop memcached