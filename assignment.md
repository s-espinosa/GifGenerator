# GifGenerator

*Goal:* Create an app where users can "favorite" gifs.


## Users

* Regular users can mark a gif as "favorite".
* Regular users can see a list of all of the gifs they've marked as favorites.
* Regular users should be able to see favorited gifs sorted by category.
* Regular users should be able to see all gifs sorted by category.
* Regular users cannot delete a gif; they can only "unfavorite" it for themselves.

### Authentication and Authorization

* users need to log in to see their favorited gifs
* users can only see their own favorited gifs -- they should not be able to visit another user's page
* users cannot create favorites for other users
* users cannot create new categories -- only the admin can do that
* users cannot create gifs -- only the admin can do that







### Optional Extensions

* Implement Twitter, Github, or Facebook OAuth login
* Use HAML for your views
* TDD using RSpec instead of Test::Unit
