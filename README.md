# Cafeteria ERP
This is a simple ERP system for managing a cafeteria. It is built with Laravel and Livewire.
It is meant to be modular and extensible. It is meant to be easy to use and easy to deploy. It is meant to be easy to maintain and easy to scale. It is meant to be easy to secure and easy to optimize. It is meant to be easy to document and easy to test.
In the spirit of seamless collaboration, here are some guidelines to help you get started with the project.

## The Developer's Guide
### Setup for Development with Docker
1. Clone the repository
2. Copy `.env.example` to `.env` and fill in the necessary values
3. Build the app container with `docker-compose build app`
4. Spin up your containers with `docker-compose up -d`
5. From this point on, you can run commands in the app container by first bashing into the container using `docker-compose exec -u dev app bash`.
6. Run `composer install` to install the necessary dependencies
7. Run `npm install` to install node dependencies for development
8. Run `npm run build` to build the assets
9. Run `php artisan key:generate` to generate a new application key
10. Run `php artisan core:install` and follow prompts to setup the core features, run migrations and seeders, create a super admin etc.
11. Exit the container and run `docker compose restart` to restart containers.
12. That's it, you can now access your app for development at `http://localhost:<DOCKER_NGINX_PORT>`

### Updating the Core Theme
While in the app container, `cd Modules/Core` and run `npm install` to install the necessary dependencies. You can then run `npm run build` to build the assets.

### Running Tests
While in the app container, you can run `php artisan test` to run the tests.

### Formatting your code
While in the app container, you can run `./vendor/bin/pint` to format your PHP code with laravel pint.

### Running PHPStan
While in the app container, you can run `./vendor/bin/phpstan analyse` to run PHPStan and detect any errors in your app during development.

### Organizing your code
This app is meant to be modular. Each module is supposed to be as independent as possible. For example, if I pluck out the `Blog` module, the rest of the system should still work.
* As much as possible, write all your code in the modules. Avoid writing code in the `App` namespace unless inevitable.
* The Core module is a mandatory module since it has most of the tools and features that will be used by other modules in the app.

### Writing Tests
* Write tests for your code. This is very important. If you are not sure how to write tests, ask for help.
* Write tests for your controllers, services, repositories, and any other class that has logic.
* Write tests for your models if they have custom logic.
* Write tests for your API endpoints.
* Write tests for your views if they have logic.
* Write tests for your commands and jobs.
* Write tests for your event listeners and subscribers.
* Write tests for your middleware.
* Write tests for your policies and gates.

### Writing Documentation (Coming Soon)
* The system will use `vitepress` to generate documentation. You can write your documentation in markdown files in the `docs` directory.

### Writing Code
* Write clean code. Follow the PSR standards.
* Write code that is easy to read and understand.
* Write code that is easy to test.
* Write code that is easy to maintain.
* Write code that is easy to extend. If you would like to extend the functionality of an existing package, use Macros if supported
* Write code that is easy to debug.
* Write code that is easy to deploy.
* Write code that is easy to scale.
* Write code that is easy to secure.
* Write code that is easy to optimize.
* Write code that is easy to document.
* Support Localization and Internationalization for all your strings.
* Use the Laravel Localization features for all your strings.
* Use the Laravel Translation features for all your strings.

### Writing Comments
* Write comments for your code. Comments should explain why you wrote the code and not what the code does.
* Write comments for your classes, methods, and properties.
* Write comments for your tests.
* Write comments for your views.
* Write comments for your configuration files.

### Writing Commit Messages
* Write meaningful commit messages. Your commit messages should explain why you made the changes.

### Writing Pull Requests
* Write meaningful pull request titles. Your pull request titles should explain what the pull request does.
* Write meaningful pull request descriptions. Your pull request descriptions should explain why you made the changes.
* Write meaningful pull request comments. Your pull request comments should explain what you are doing.
* Always reference the issue number in your pull request title or description.
* Before you push anything, pull to get the latest changes from the main branch.
* Before you push anything, run the tests to make sure everything is working.
* Before you push anything, run the linters to make sure your code is clean.
* Always push your code to a feature branch and not the main branch.
* Push as often as possible
* Always squash your commits before merging your pull request.

### Writing Issues
* Write meaningful issue titles. Your issue titles should explain what the issue is about.

### Database Triggers
There are a few basic triggers included in the Core module. These triggers are meant to help with the following:
* Automatically updating the `code` field in all tables that have a `code` field when a record is created.
* Automatically logging to the Audit Log table when a record is created, updated, or deleted.
* Avoiding modifying or deleting immutable or posted records.
However, we are rethinking the whole logic of triggers and weighing it against using Laravel Observers and Mutators. We will update this section once we have made a decision.
* If you have any ideas on how to improve the triggers, please let us know.
* If you have any ideas on how to improve the Audit Log, please let us know.
* If you have any ideas on how to improve the Immutable and Posted records, please let us know.
* If you have any ideas on how to improve the Code generation, please let us know.
In the meantime, please do not modify the triggers or the Audit Log table.

### Database Migrations
* Always write migrations for your database changes.
* Always write seeders for your database seed data for testing
* Always write factories for your database seed data for testing
* Always write policies for your database access control