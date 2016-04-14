# GifGenerator

*Goal:* Create an app where users can "favorite" gifs.



## Visitors

* visitors (non-registered users) can create user accounts



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



## Admins

### Generating Gifs

* Generate gifs by entering a one-word search term in field and then clicking "generate gif".
* Use [Giphy API](https://github.com/giphy/GiphyAPI)
* Gifs belong to a category (category is the original word that was searched for by the admin).
* Should create a new gif in the database.
* Feature is not available to regular users.

### Categories

* Categories can be created and destroyed by a logged-in admin user (regular logged in users cannot create or destroy categories)



## Gifs

* Gifs should have an image_path.
* The most simplistic way to implement images is to store a url to an online image.
* If you're feeling fancy and want to upload your own images, check out [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) or [Paperclip](https://github.com/thoughtbot/paperclip).
* Use the GiphyApi to generate gifs.




### Optional Extensions

* Implement Twitter, Github, or Facebook OAuth login
* Use HAML for your views
* TDD using RSpec instead of Test::Unit
