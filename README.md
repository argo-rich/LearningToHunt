# LearningToHunt
I created this site to get my hands wet with Angular and ASP.NET Web API.  This site uses Angular 
19 and C# 12/.NET 8.  It also uses a MySQL database to house article content and registered user 
information.

## Current Functionality
Article content is pulled from the database and sent via JSON up to the client side
to be displayed.  Articles can also be edited from the website itself.  If a logged in User is in the Admin 
role, then while viewing an article, an "Edit" link displays allowing the user to edit the article on the fly.

Users can register for an account and receive an email confirmation containing a link to confirm their email.
Once this link is clicked, the user can log in.  Users can also update their account (email, password, 
first/last names) and use the forgotten password functionality if needed.

### Notes of Interest
One interesting tidbit on the article editing is that Angular was stripping out element ID's when saving article
content.  This is for security purposes, but does not allow for anchor links to work.  To get around 
this, I ended up adding a placeholder div to the content with a class="anchor-links" which I then dynamically
add anchor links to at runtime by searching for all H2's with a class of anchor-point and adding anchor links
for each.

## Future Functionality
The following is planned:
- Ability for Admins to create an article from scratch.
- Ability for users to add comments to articles.
- Create additional article content
