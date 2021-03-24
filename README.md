This is a test project done with laravel admin package Voyager

## Installation Steps

### 1. Download the project from github

Follow this link "https://github.com/jesssewovon/VoyagerTest.git" to download the project from github. Move the project to your server web folder : e.g. www or htdocs

### 2. Create Database

       1. Open your Database engine system and create new database named "tp_log".
       2. Run the migration command "php artisan migrate" to generate the database.
       3. Run the following command to generate test datas for projets and logs "php artisan db:seed".

### 3. Create an admin user

Create an admin user account with `php artisan voyager:admin your@email.com --create` where `your@email.com` will be your real email.

### 4. Start the project

Start up a local development server with `php artisan serve` And, visit [http://localhost:8000/admin](http://localhost:8000/admin).
Connect with the previous admin account created.

visit [http://localhost:8000/login](http://localhost:8000/login) to connect with a normal user created from admin dashboard.

visit [http://localhost:8000/api/projets](http://localhost:8000/api/projets) to get the list of "projet" in json format.

visit [http://localhost:8000/api/logs](http://localhost:8000/api/logs) to get the list of "log" in json format.
You can test with postman software.

