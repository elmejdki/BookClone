# BookClone

> This project was born as a result of 2 weeks of dedicated hard work, between me [@Zakariae](https://www.linkedin.com/in/zakariaeelmejdki/), and my partner [@Franco](https://www.linkedin.com/in/franco-rosa-79972119b/), after finishing the Rails curriculum on Microverse we decided to build a Facebook replicate in order to understand more the structure of Ruby on Rails, but we were serious about building something beautiful like this, please feel free guys exploring the [app](https://book-clone.herokuapp.com/) and if you have some new feature that you want to propose don't hesitate to open an issue on this repository with the specified details.

## Home Page

![image](https://user-images.githubusercontent.com/34653764/85905868-8c36c100-b804-11ea-8e4b-32a7e307d451.png)



## Entity Relation Diagram

- Here is the Entity Relation Diagram that we have used in this project

![image](https://user-images.githubusercontent.com/34653764/85909879-f2771000-b813-11ea-909e-22b4a2dafe19.png)


## Features
- User can log in using an email and password;
- User can sign up, entering his personal information;
- User can access his profile;
- User can access all users profile;
- User can add a friend;
- User can cancel a friend request;
- User can accept or decline a friend request;
- User can share a post, delete and edit his own posts;
- User can like, dislike and leave a comment on a post;
- User can send messages to other users;
- User can receive messages from a user;
- User can change his avatar;
- User can change his cover picture;
- User can update his personal information;

## Built With

- Ruby v2.6.5,
- Ruby on Rails v6.0.3.2,
- Action Cable
- AWS S3 services

## Live Demo

[![heroku image](https://user-images.githubusercontent.com/34653764/84539874-2fa7b200-acec-11ea-845d-850aeebf2b27.png)](https://book-clone.herokuapp.com/)


## Getting Started

**This is an example of how you may give instructions on setting up your project locally.**

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Ruby: v2.6.5p114
- Ruby on Rails v6.0.3.2
- Postgres: >= 9.5
- AWS credentials

### Setup

- Install gems with:

```
  bundle install
```

- Setup database with:

```
  rails db:create
  rails db:migrate
```

## IMPORTANT

**I used the S3 AWS service in order to store images. Therefore, I used SECRET KEYS stored in environment variables on my development and production servers.**

- So if you have AWS credentials create a new file named `application.yml` inside `config/` directory and then past your credentials in it like showing bellow:

```ruby
  development:
    access_key_id: your_access_key_id_goes_here
    secret_access_key: your_secrect_access_key_goes_here
```

### Usage
Start server with:

```
  rails s
```

Then open `http://localhost:3000/` in your browser

# Future Features

- Make the search field working so we can allow users to search for each other

  Add pagination to the list of posts and friends also 

  Add, birthday to the user model, to cheer if someone birthday comes soon or whatever

  Add some javascript validation for the signup page

  Show a notification if someone liked my post or commented on it.

## Authors

👤 **Zakariae El Mejdki**

- GitHub: [@elmejdki](https://github.com/elmejdki)
- Twitter: [@zakariaemejdki](https://twitter.com/zakariaemejdki)
- Linkedin: [Zakariae El Mejdki](https://www.linkedin.com/in/zakariaeelmejdki/)

👤 **Franco Rosa**

- Github: [@FrancoRosa](https://github.com/FrancoRosa)
- Linkedin: [Franco Rosa](https://www.linkedin.com/in/franco-rosa-79972119b/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/elmejdki/bookclone/issues).

## Show your support

Give a ⭐️ if you like this project!
