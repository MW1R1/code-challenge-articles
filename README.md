# code-challenge-articles
Articles App
This is a Ruby application that allows you to manage authors, magazines, and articles within a magazine domain. You can create authors, magazines, and articles, associate them with each other, and perform various operations on them.

Prerequisites
Before running this application, ensure that you have the following prerequisites installed on your system:
Ruby (version 2.5 or higher)
SQLite3

Setup
Clone the repository to your local machine.

Install the required Ruby gems by running the following command in the project directory:
bundle install
Set up the database by running the following command:
ruby setup_database.rb
This will create a database.db file and set up the necessary tables for authors, magazines, and articles.

Usage
To run the application, execute the following command:
ruby main.rb
This will start the application and display the output in the console.

In the main.rb file, you can modify the program logic to perform various operations on authors, magazines, and articles. The provided example displays a basic output of all authors, magazines, and articles.

Customization
If you want to customize the database or add more functionality to the application, you can modify the database.db file directly or make changes to the class files (author.rb, magazine.rb, article.rb) to extend their methods and behavior.

Contributing
Contributions to this application are welcome. If you find any issues or want to add new features, please feel free to submit a pull request.

License
This application is licensed under the MIT License.

Author
This project's author is Nick Mwirigi as part of course requirement for phase 3 week 2 code challenge.