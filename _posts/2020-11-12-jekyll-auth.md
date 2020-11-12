---
layout:	post
title:	jekyll-auth
date:	2020-11-12 15:32:54 CET
categories:	jekyll auth heroku
---
This version of the blog is hosted for free on [github pages](https://pages.github.com/), which is great for public pages. For some cases that might not be satisfying and some information needs to be protected behind an authentication wall. For that purpuse I found ``jekyll-auth`` where you can use Githubs own authentication service and their teams configuration to protect your site.

The setup was fairly easy using this [guide](https://ben.balter.com/jekyll-auth/)

In short:
  * You will need to have an account on Gitlab and an Organization
  * The members of your organization will be the ones allowed to access your page
  * A Heroku account for hosting (it should be possible to host on other places too)

Some comments from myself when following the guide:
  Its not underlined in the guide that one needs to configure the project with a Team ID, but if that is not correctly configured it will not be possible to login to the site.
  i.e, the following environment variables must be configured:
  ``
GITHUB_TOKEN=some-token
GITHUB_TEAM_ID=123456
GITHUB_CLIENT_ID=abcd-efgh-ijkl
GITHUB_CLIENT_SECRET=the-client-secret
GITHUB_ORG_NAME=name-of-organization
  ``

I also had some initial issues with the build process, I can recomend looking att the logs from Heroku with the command ``heroku logs --tail -a {PROJECT_NAME}``. Using that I relized that I needed to specify the following line in my Procfile using in Heroku when starting the project:
  
``web: jekyll-auth serve --port $PORT --host 0.0.0.0``

The 'PORT' variable should be as in above, it's an internal variable set by Heroku depending on what port that is allocated for you. The 'host' argument can be specified differently depending on what hosts you want to allow. By specifying 0.0.0.0 any host will be allowed to see the page (but not the content, if jekyll-auth is configured correctly). 

  
