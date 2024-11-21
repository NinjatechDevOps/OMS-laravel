# Application Setup Guide

This guide will help you set up the application on your system using Docker.

---

## Step 1: Setup Docker

Ensure that Docker is installed and running on your system. You can download Docker from the [official Docker website](https://www.docker.com/).

---

## Step 2: Clone the Repository

Clone this repository to your local machine using the following command:

```bash
git clone <repository-url>
```

---

## Step 3: Copy the contents of .env.example to .env

Copy the contents of .env.example to .env using the following command:

```bash
cp .env.example .env
```

---

## Step 4: Change the content in .env:

Ensure the the following content is replaced in the .env:

```bash
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=oms
DB_USERNAME=oms
DB_PASSWORD=password
```

---

## Step 5: Set the permission of the folder

Set the following file permission for the application code:

```bash
sudo find . -type f -exec chmod 664 {} +
sudo find . -type d -exec chmod 775 {} +
sudo chgrp -R www-data storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache
```

---

## Step 6: Build the application

Build the application using the docker compose command:

```bash
docker compose up -d --build
```

---

## Step 7: Execute Package Commands in the docker container

Build the application using the docker compose command:

```bash
docker exec -it oms-app composer install
docker exec -it oms-app npm install
docker exec -it oms-app npm run build
docker exec -it oms-app php artisan migrate
docker exec -it oms-app php artisan db:seed
docker exec -it oms-app php artisan key:generate
```

---

## Step 7: Access the application

You can now access the application on (http://localhost:8081/)

---

## 🌟 Key Features

- **Orders**
  - Create Orders
  - Pending Orders
  - Complete Orders
  - Pending Payments
- **Products Management**
- **Customer Records**
- **API's**
  - Products
  - Customers
  - Orders
  - Order Create
  - Get Discount
  - Order Pay
  - Order Status Update
  - Retrieve Order

## 🚀 API's

1. **Import Json collection to postman:**

import `postman_collection.json` file to postman for api testing ( stored in public folder )
