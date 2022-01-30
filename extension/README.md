# Overview - TCP Messaging App

This is an extension task in which I built a notes app that works over the local network.

I started off by loosley test driving a notes app:
- Users class, which contains a list of all users
- User class, which contains user functionality
- Notelist class, which contains note functionality

Notelists are owned by a user which are owned by the users class.

The next step was to build a command line interfact to allow the app to be operated simply and over a network. This is contained in /lib/server.rb:
- I use a case-when structure to allow user input to select functionality

## To operate

- Run [$ irb server.rb] on one computer
- Run [$ telnet '[network ip]' 2345] on another computer on the same network. Network ip must be network ip of the server computer. Running [$ ifconfig en0] on a mac will show network up

## Interacting with the app
 
 - Create a user, password, and enter some notes
 - List the notes
 - Lock the user account and show that notes are no longer listed
 - Create a 2nd user, enter some notes, list them
 - Log back in a 1st user and show that their notes are distinct

 ## Comments

 - User data is only saved as long as the server remains running. It gets deleted when the server drops

 ## Next steps

 - Implement local storage so that user data persists when server is dropped and restarted
 - Implement rudimentary encryption and decrpytion of the password so that raw password is not stored
 - Refactor the server so code is DRY, easier to read, makes use of classes, etc
 - Run the app over the internet, rather than merely a local network
