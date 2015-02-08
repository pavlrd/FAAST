[![Code Climate](https://codeclimate.com/github/palyrex/FAAST/badges/gpa.svg)](https://codeclimate.com/github/palyrex/FAAST) [![Test Coverage](https://codeclimate.com/github/palyrex/FAAST/badges/coverage.svg)](https://codeclimate.com/github/palyrex/FAAST)

####Week 1 Challenge at Makers Academy!

####SYNOPSIS

Implement FAAST System (Fast And Accessible Super Tube). Test it first.

**The FAAST system will cater for the following:**

  - There will be a number of trains inside the system.
  - Trains will travel from station to station.
  - Inside of a station, when the train stops, passengers will alight and enter the 
    carriages of the train.
  - A Passenger will touch in at the station and touch out at the destination station.
  - Each coach of a train can hold up to 40 passengers.
  - Each train is made of a number of coaches.
  - BONUS - add a charging system where the passengers can only touch in a station (and 
    access the train) if their account has more than 2 GBP.

####MY APPROACH
As its stands for good projects to be started, first thing needs to be done is to understand what the problem actually is. I consider some nouns and verbs, which stands after for responsibilities, classes and collaborators. The Classes I decided relevant is **Passenger, Train, Station, Coach.** In the end I did small refactoring and implemented **TubeContainer**module.

####TECHNOLOGIES:

- *Ruby*

- *Rspec*

#####PROGRAMMING CONCEPTS:

- *Test driven development (TDD)*

- *Object Oriented Design (OOD)*

- *Object Oriented Programming (OOP)*

####HOW TO RUN

type in your terminal/commandline

```
ruby ./faast.rb

```

####CODE SNIPPET

My Train Class

![alt tag](https://github.com/PaweI/FAAST/blob/master/public/train_class.png)

####WHAT I'VE LEARNT

That there is always a lot of ways to solve a problem. But try not to Overthink one cause you can end up with job undone, and with lots of unnecessary complexity. And before writing any code, first thing is to understand what you need to do and how, only then CODE. 

####FUTURE IMPROVEMENTS

I would like to not check if passenger in the tube system, but rather verify if he/she is at the particular station in order to reduce complexity of Passenger class. 

And another thing I want to is to change some statements to make them more readable as plain English.


