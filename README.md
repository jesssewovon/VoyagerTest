This is a test project done with laravel admin package Voyager

## Installation Steps

### 1. Download the project from github

Follow this link "https://github.com/jesssewovon/VoyagerTest.git" to download the project from github. Move the project to your server web folder : e.g. www or htdocs

### 2. Create Database

Open your Database engine system and create new database named "tp_log". Import in the database created earlier the sql file "tp_log.sql".

### 3. Start the project

Start up a local development server with `php artisan serve` And, visit [http://localhost:8000/admin](http://localhost:8000/admin).

Connect with the following admin account:

>**email:** `admin@admin.com`   
>**password:** `password`

visit [http://localhost:8000/login](http://localhost:8000/login) to connect with a normal user created from admin dashbord.

visit [http://localhost:8000/api/projets](http://localhost:8000/api/projets) to get the list of "projet" in json format.

visit [http://localhost:8000/api/logs](http://localhost:8000/api/logs) to get the list of "log" in json format.
You can test with postman software.

