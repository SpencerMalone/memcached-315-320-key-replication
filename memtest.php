<?php

$memcached = new Memcached();

$memcached->addServer('memcached', 11211);

var_dump($memcached->set(utf8_encode("\x5A\x6F\xEB"), "data"));
var_dump($memcached->getResultMessage());
var_dump($memcached->get(utf8_encode("\x5A\x6F\xEB")));
