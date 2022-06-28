# WordPress Docker - containerize Wordpress for development

This project is a simple containerized Wordpress installation for development.

## **It is not intended for production use.**

## Usage

* Clone the repository
* Run `docker compose up`
* If it's a first run, fresh latest Wordpress will be downloaded and installed.
* Set up your WordPress site on [http://localhost](http://localhost)
* Wordpress files like `wp-config.php` are stored in the `wordpress-data` directory, so you can edit them directly
* You can customize the `docker-compose.yml` file to change the image versions, ports, etc.

## Customization

* In `php.ini` change PHP settings
* In `Dockerfile` change included PHP modules ([documentation](https://github.com/mlocati/docker-php-extension-installer))
* In `docker-compose.yml` change `mariadb` to `mysql`, add `redis` or `memcached`, etc.
* Customize `.gitignore` to keep themes / plugins / etc.

## Troubleshooting

* If you cannot edit Wordpress files (theme, plugins, updating, etc.), set `WWWGROUP` to your user group and try again.
* If Wordpress cannot access the database, check if `DB_HOST` in `wp-config.php` matches database service name in the `docker-compose.yml` file.

## Thanks to [mlocati](https://github.com/mlocati/docker-php-extension-installer) for PHP extension installer
