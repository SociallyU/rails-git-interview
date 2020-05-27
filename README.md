# Rails Programming Challenge

## Objective

Github has an API!!!
Your goal is to create a rails app that allows a user to input the username of
a github user and retrieve their name, email, and public repo count from the
Github API.  Then we spit it out onto the screen for the user.

Github API documentation: https://developer.github.com/v3/users/#get-a-single-user

## Details

After each API call we should persist the user details (name, email, and public
repo count) to the database.  That way if the username is queried again we can
simply pull the details from the database.

Performance isn't important for this so we don't need to worry about creating
any sort of background process.

Styling isn't important however you should use correct markup.

Javascript or ajax isn't important.  Full page reloads and server side
rendering ftw.

## Submission Guidelines

Fork this repo, make your changes, submit a pull request.  Be prepared to
discuss your decisions.

## Hints

* It's OK to ask questions
* This test is not about your knowledge of a specific gem or tool.
* Bonus points for Tests (rspec or minitest)
