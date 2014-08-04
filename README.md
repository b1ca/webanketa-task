webanketa-task
==============

Several automates tests for webanketa.com
Using Ruby, selenium-webdriver, page-object, rspec.

1 scenario:
  Log in to webanketa.
  Create form (Akan language, simple uniqueness).
  Verify form creation.
  
2 scenario:
  Log in to webanketa.
  Navigate to 'My Forms' page.
  Verify 'My Forms' page.
  
3 scenario:
  Log in to webanketa.
  Navigate to 'My Forms' page.
  Choose first form.
  Add 'one from many' radiobutton.
  Save form.
  Verify button added.
  
4 scenario:
  Log in to webanketa.
  Create form (English language, simple uniqueness).
  Get form url.
  Log out.
  Navigate form url as anonymous.
  Verify that form is unpublished for anonymous user.
  
5 scenario:
  Log in to webanketa.
  Create form (English language, strict uniqueness).
  Publish form.
  Verify form published.
  
  
Requirements
==============
"rspec", "~>3.0.0"
"page-object", "~>1.0.2"
"selenium-webdriver", "~>2.42.0"
Firefox browser

To run tests use
==============
```bash
git clone git@github.com:b1ca/webanketa-task.git
cd webanketa-task && bundle
rake
```
