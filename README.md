# TDD/BDD Hacker News Homework

Hacker News is a social news website that caters to programmers and entrepreneurs, delivering content related to computer science and entrepreneurship.

While Hacker News is written in Lisp, we're going to write our own version of Hacker News using TDD & BDD in Rails.

### Assignment

Create Hacker News using TDD to test your models, and BDD to create the rest of the application. Use Alex's diagram for flow if there's any question about the order of building things.

There are two notable parts that we do **not** need to implement:

- Nested comments. Simply show the highest voted comments at the top and don't allow replies to specific comments, just to the overall submission.
- Stories **or** Discussion pages. Allow for every link submission to have a link, and a description for additional commentary. On the real HN, every submission can either have a link *or* description, but not both.

Otherwise, it should visually resemble Hacker News and function much like Hacker News. Users can create accounts, login, submit links, make comments, and upvote downvote comments and see top stories on the front page.

You should have excellent test coverage, and you should deploy this to Heroku. You have tonight *and* tomorrow night to work on this, but structure your time wisely. Tomorrow you should refactor your tests to use FactoryGirl. There will also be some polymorphic refactoring that you'll want to do tomorrow.


### Bonus

Investigate into how the point/voting system works and implement a method that will allow the posts to 'decay' over time, just like they do on HN or Reddit. In the past, students have found this research to be fulfilling.
