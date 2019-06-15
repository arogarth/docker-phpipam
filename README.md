PHPIPAM Docker Container
=========================

Used PHP-Version: 7.2-apache 

Installed PHP Extensions
* pdo
* pdo_mysql
* session
* sockets
* gmp
* ldap
* simplexml
* json
* mbstring
* gd
* gettext

Variables
=========

| Variable       | Description                           |
|----------------|---------------------------------------|
| MYSQL_HOST     | MySQL Host to connect to              |
| MYSQL_USER     | MySQL User                            |
| MYSQL_PASSWORD | MySQL Password                        |
| MYSQL_DATABASE | MySQL Database                        |
| MYSQL_PORT     | MySQL Port (default: 3306)            |
| PHPIPAM_DEBUG  | phpIPAM enable debug (default: false) |
| PHPIPAM_BASE   | phpIPAM Base URI (default: "/")       |

Example Setup
==============

File: docker-compose.yml

    version: "3"
    services:
      phpipam:
        container_name: phpipam
        image: arogarth/phpipam
        build: .
        ports:
          - 8080:80
        env_file: database.env
      mysql:
        container_name: mysql
        image: mariadb
        env_file: database.env


File: database.env

    MYSQL_HOST=mysql
    MYSQL_ROOT_PASSWORD=Start123
    MYSQL_DATABASE=phpipam
    MYSQL_USER=phpipam
    MYSQL_PASSWORD=phpipam
