<h1 align="center">
  <img src="https://github.com/will-r-wang/COMP3004-CMS/blob/main/app/assets/images/cmslearn.svg" width="300"></img>
  <br>
  CMSLearn
</h1>

## About this repo
**Introduction:** CMSLearn is a full-stack Course Management System implemented for the COMP3004 Object-Oriented Software Engineering Course in Ruby on Rails. As requirements part of the project spec, it leverages several design patterns which are diagrammed in the `docs` folder and whose working implementation exists as part of our final report and code history.

|                |                                                                                                                                      |
|----------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Current status | Pre-Alpha Release: Follow updates [here](https://docs.google.com/document/d/1bBDeTGfd4_vm8xJnxaG-xPekNAIPhWuiBaUeO8sokKk/edit) |
| In progress    | Follow https://github.com/will-r-wang/COMP3004-CMS/projects/2 for what we're currently working on |
| Owner          | This repo is primarily maintained by individual contributors |
| Help           | For developer or design related questions, please send an email to william.wang@hey.com |

## How to use this repo
### Requirements
Here are some things you need to do in order to get started with CMSLearn:
- Follow the [official Rails guide](https://guides.rubyonrails.org/getting_started.html) to get setup with Ruby on Rails if you have not already done so
  - To check if Rails is running after these steps, run `rails --version` in your terminal
- Clone this repo and navigate to the root level with `git clone https://github.com/will-r-wang/COMP3004-CMS.git`
- Install all the relevant dependencies with bundler and yarn
  - First `bundle install` for 💎s
  - Then `yarn add chartkick chart.js bootstrap jquery popper.js` for all the 🧶 packages
- Seed the database with `rake db:reseed`
- Run `bin/rails server` and you should be ready to go!

### Testing
To run the entire test suite, run `bin/rails test`.
For a specific tests, run `bin/rails test test/<my-test.rb>`.

### Documentation
### Technical Details
Most of our technical documentation is contained in our [final project report](https://docs.google.com/document/d/1CPJAYgydgh0R1H8ouRL1dFMgYW8icH7VyyW1K2jpyRc/edit?usp=sharing) and the [evergreen weekly report](https://www.google.com/url?sa=t&rct=j&esrc=s&source=appssearch&uact=8&cd=0&cad=rja&q&sig2=WscJ5bEve-ZmELvgK_UmaA&ved=0ahUKEwjuxvrZovrvAhUN4TcKHfoMCpE4ABABKAAwAA&url=https://drive.google.com/a/shopify.com/open?id%3D1bBDeTGfd4_vm8xJnxaG-xPekNAIPhWuiBaUeO8sokKk%26usp%3Dchrome_omnibox&usg=AOvVaw3A23jXHVZeWkENnhfg0zvE).

### Technical Details
CMSLearn 🛡🍁📖 is released under the [MIT License](https://opensource.org/licenses/MIT).

*Note: Some of the implementations of the design patterns may not be 100% valid as per industry standard, but a conscious effort was made to implement the mandatory patterns in placed where we felt was most appropriate.
