##Hair Salon Organizer

You can use this organizer to maintain your hair salon more efficiently.
You may list your stylists and under each stylist, you can list their clients.


##AUTHOR

Jessica Hori



##DATABASE SETUP


This Hair Salon app is used in connection with the database POSTGRES.
Run psql in the terminal.

Step 1. ```CREATE DATABASE hair_salon```

Enter the database ```\c hair_salon```

Step 2. ```CREATE TABLE stylists (id serial PRIMARY KEY, name VARCHAR)```

Step 3. ```CREATE TABLE clients (id serial PRIMARY KEY, name VARCHAR, stylist id INT, appointment_date DATE)```

Step 4. ```CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon```




##LICENSE

GNU GPL v2.0
Feel free to download, copy, and improve via fork and pull request.
