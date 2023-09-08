KartCheck 2023 - V1

This is my second self-guided app and first using Tailwind CSS, I did use a Tailwind Starter template called KickOff Tailwind to provide the basics.

This is the first version of the KartCheck app, the plan is for this to be a digital logbook for users to register their chassis' and engines

It will allow other users to search for those to check their history, check the stolen status, and transfer ownership.

Stack is;
Rails 7
Ruby 3
PostGres
Devise for Auth
RSpec for testing (inc Shoulda Matches and FactoryBot)

----------------

September 2023

The app is now a full CRUD app for Engine's and Chassis with a User Dashboard. There is some admin user auth which allows the admin user to view all Chassis' and Engines on their dashboard but Users can only view their own.

I was hoping to launch this app online and open it up for people to use but given the nature of the app and the security issues surrounding it I felt it would take too much of my time to manage, maintain and improve. If it was a simple blog app then fine but the fact that people would be putting Identification numbers in for high value items and relying on it for peace of mind and possibly resolution of thefts it's not something I feel would be best use of my time versus starting another app with less sensitive subject.

I did play around with Turbo frame for the CRUD views at one point but I feel would be easier to implement that when building the model and views from scratch in the next app.

I did use some turbo frames for linking to anchors on the homepage to enable the user to search without a full page load and ensure that the results are shown and the user does not have to scroll down to find them.

Most text was written in a rush as something better than placeholder text so there some spello's etc

Mailers exists and work the basi contact form functions but are not styled or written with proper content.

Test coverage probably isn't 100% but again learning Rspec as I go on this one.

The Devise features hasn't been edited much other than styling in the views.

Model validation error messages could do with some styling work.

The enging and chassis forms are not matching as was in the middle of restyling similair to the show view but wanted to move onto a new project which had the potentail to go live.

-----------------