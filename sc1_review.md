# Food Club

### Rules

The first rule of Food Club is you don't talk about Food Club.

So today we're building an app that helps us keep track of a `FoodClub`. Food Clubs a groups of foodies (people who enjoy food) who get together regularly for theme dinners. Food Clubs span a certain time period (i.e., they have a start date and an end date) and they wrap up with a grand finale dinner.

In our app, we're keeping track of a few things:

* `Foodies` - the people in the club (who have `name` and `email` attributes)
* `Entrees` - the dishes that `Foodies` bring to each `ThemeDinner`. These have a `dish_name` and `foodie` attribute (which accepts a `Foodie` object)
* `ThemeDinners` - the regular gatherings that `FoodClubs` have. These have a `theme_name` and `dinner_date` (which accepts a `Date` object)
* `FoodClub` - the club itself which have a `name`, `start_date`, `end_date`, a list of `foodies` and `theme_dinners` as well as a `grand_finale` that occurs 1 day prior to the `end_date`

### Getting Started

Start by running `bundle install` and then `rspec spec`.

Let the tests guide your development.

All of the tests must pass without changing the test code.
