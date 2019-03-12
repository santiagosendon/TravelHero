Starting Up a Rails App
This lesson has all the necessary parts of a fully working React app. To check the app out, fork and clone this lesson onto your computer, navigate into directory, and run:

bundle install
This will get and install all the required dependencies for Ruby on Rails.

Next, we need to start up a server for the app to run on:

rails s Command
This will host the app and open a browser window to display it. If the browser doesn't open, but the server started correctly, you can use the links that appear in the terminal to access the app. They should look something like the following:

Local:            http://localhost:3000/
On Your Network:  http://192.168.1.5:3000/
You can use the Local link to open the app in your own browser. The second is for any other computers on your network that you want to access your app from.

If everything has worked correctly, you should see a page with the exact time it was loaded, along with a small amount of text and a GIF.

If we make any changes to our app while the server is running, it will 'hot reload,' and update the app in the browser. If there are app breaking errors in your code, the browser will display those errors instead.


* ...
# TravelHero
