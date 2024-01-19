# Rails Application Readme

## Technical Description

This Rails application is built using the following technologies:

- **Ruby:** 3.3.0
- **Rails:** 7.1.3
- **Frontend Template:** Liquid
- **Database:** PostgreSQL

## Background

This project involves the development of a web application that manages user details and daily records. The application uses Ruby on Rails as the primary framework, with a PostgreSQL database for data storage.

## Job Scheduling with Sidekiq

The application utilizes Sidekiq, a background processing framework, for executing asynchronous jobs. Two specific jobs have been implemented:

1. **Fetch User Detail Job:**
   - **Execution Frequency:** Every hour
   - **Description:** This job is responsible for fetching user details. It runs periodically to keep user information up-to-date.

2. **Create Daily Record Job:**
   - **Execution Frequency:** 2 minutes before the end of each day
   - **Description:** This job is designed to create daily records. It ensures that daily records are generated at the end of each day.

## Liquid Templating Engine

The application uses Liquid as the frontend template engine. Liquid provides a flexible and secure way to display dynamic content. It is particularly useful for rendering user details and daily records in a visually appealing manner.

## Database

The PostgreSQL database is employed to store and manage the application's data. This relational database is chosen for its reliability and scalability, making it suitable for handling user information and daily records.

## Features

- **User Search:**
  - Users can search for other users by name. This feature enhances user experience by providing a quick and efficient way to find specific individuals.

## Getting Started

1. **Installation:**
   - Make sure you have Ruby 3.3.0 and Rails 7.1.3 installed.
   - Run `bundle install` to install the required gems.
   - Configure your PostgreSQL database settings in `config/database.yml`.

2. **Database Setup:**
   - Run `rails db:create` to create the database.
   - Run `rails db:migrate` to apply database migrations.

3. **Job Scheduling:**
   - Ensure Sidekiq is set up and running.
   - Configure the job scheduling parameters in the Sidekiq configuration.

4. **Run Sidekiq Server:**
   - Execute `sidekiq` to start the Sidekiq server for background job processing.

5. **Run the Application:**
   - Execute `rails server` to start the Rails server.
   - Access the application at `http://localhost:3000`.

## Conclusion

This Rails application combines the power of Ruby on Rails, PostgreSQL, Sidekiq for background jobs, and Liquid templating for a robust and user-friendly experience. The scheduled jobs ensure that user details are regularly updated, and daily records are generated seamlessly. The search functionality enhances user interaction, making it easy to find and access relevant information.
