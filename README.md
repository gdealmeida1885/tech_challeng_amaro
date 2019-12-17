# AMARO'S TECH CHALLENGE

#### A few notes before we start...
This repo is going to be used to display the AMARO's Tech Challenge, used to evaluate applicants of QA Analyst position.
The files are organized just like the case study, in 4 parts.

*The Part 1 of the challenge is the only one displayd here at the README.md*. Within it's folder, there's the evidence of the issues found while I was testing the Web and Mobile applications. 

I really hope I've had met the expectations and any suggestions of improvements are very welcomed.

Thanks! :)

---

## Challenge 1 - Plataform Analysis
  ##### All the tests were ran in a Samsung Galaxy S9+ and a Xiaomi Mi9T with both devices beign at Android 9.0. The evidences were gathered at Xiaomi Mi9T

__**Mobile App**__

* When the user [opens the app without internet](/part_1/Mobile/mobile_scenario1_reconnected.jpg) or mobile data and [reconnects afterwards](/part_1/Mobile/mobile_scenario1_reconnected.jpg), the app doesn't reload it's tabs automatically, even when [changing the menus](/part_1/Mobile/mobile_scenario1_changinMenu.jpg). 
The user has to, manually, click on "Try Again" in every menu, ir order to reload the page.

* The "My Purchases" button should be visible to the user and easily accessible in the bottom    navigation menu at the home screen. 
When someone buys an item in an e-commerce it's usual that the buyer checks the purchase status very often.Therefore having this button on the main screen, would help the user to check his purchase status faster and improve his experience.

* The "Guide Shop" button isn't showing the nearest AMARO's shops at first, but instead, is just poiting to user's location on the map and listing all Guide Shops available, making the user search manually the best and nearest store to him. 
Also, the Guide Shops aren't listed in a specific way (they could be listed in alphabetical order or nearest distance from the user). iIn my experience, [the first shop that appeared, was in Porto Alegre](part_1/Mobile/mobile_scenario3_guideShop.jpg), which is very far from where I was in the time of testing and the nereast Guide Shop (Vila Olimpia), was at the end of the list.

__**Web App**__

* [The search bar doesn't have autocomplete](part_1/Web/web_scenario1_autocomplete.png). It could give the users suggestions of what to buy while typping.

* If the user input an invalid email address he gets an [error message stating that he does not have an account registered](part_1/Web/web_scenario2_createAccount.png). It would be a better practice just show a generic message of invalid account. 
This way, it is easier to avoid malicious users trying to discover if one has an account registered.

* Sometimes, if the user mistype his email or password, while trying to login, [he gets an generic 500 message](part_1/Web/web_scenario3_error500.png). It usually happens when the user mistyped 3 or 4 times his password / email address. (This issue also occurs randomly, I've faced it a few times while automating the [Login Feature](part_3/features/spec/login.feature))

* Along the process of Sign Up, there's is no "Email Confirmation" field. Hence, if the user creates a account with an wrong email, he isn't able to recover it, due to never receive this email. Also, since user's phone number is requested, would be a good idea have a way to recover his password through it. 
In my testing, I've created a account using a mock mail (johnnydoe@doe.com) but this email doesn't exist. [Since the only way of recoverying my password was through an email sent by the platform, I've lost this account and it forced me to create another one](part_1/Web/web_scenario4_fakeMail.png).

---

## Challenge 2 - Testing Scenarios

#### Another few notes before we proceed...
The next 3 challenges are BDD based and therefore have to be writen using Gherkin. Since Cucumber has thousands ways of doing the same thing, I've decided to "mix every possible techinique" I knew, to take maximum advantage of Gherkin's syntax.  

During my analysis of AMARO's e-commerce, I've kept wondering what would be the most critical scenarios to an e-commerce. Since an e-commerce gets __ALL__ (or at least most of it) his income through the Web, I came to the conclusion that the most critical points of a e-commerce are the one's *able to prevent the user of buying stuff*. Also, instead of just writing single scenarios, I've decided to write the _Features and Scenarios_ based on it, just like would be done in the day-to-day.

Those critical scenarios are:
* [Shopping Cart Features](part_2/shopping_cart.feature)
  * It's critical because without it, there's no way of user checking what he's buying.
* [Sign Up Features](part_2/signup.feature) 
  * Without a valid registered user, there's no way of checking which user is buying which product
* [Payment Features](part_2/payment.feature)
  * Well... This feature speaks for itself. 

---

## Challenge 3 - Web Automation 

#### And more few notes...
All the Features and Scenarios are passing to this date (16/12/2019), with exception of the *Successfull Sign Up*. This is occurs because this particular feature keeps creating new users at AMARO's platform and this could to pollute and harm the database with loads of fake accounts.
Therefore I've decided to let it be a failed scenario to also show how it appears at standard cucumber's html report format.

### How to get started? 
 
#### Clone this repository :dart:
```git
git clone https://github.com/gdealmeida1885/tech_challeng_amaro.git
```
#### Access the part_3 folder :dart:

```shell
$ cd part_3
```
#### Install Ruby's dependencies manager and install projects dependencies :dart:

```ruby
 $ gem install bundler
 
 $ bundler install
```

#### Execute Project :dart:

```cucumber
$ cucumber   --format html --out=features/reports/report/report.html
```

---

# Challenge 4 - API Automation

todo: write it




