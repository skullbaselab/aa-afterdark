# Flex Project

The Flex Project helps fills in the gaps in your skill presentation not covered by your Full-Stack Project or JavaScript Project. It is flexible because it is designed to show off your strongest skills and to complement the type of job you're looking for.

For the flex project, you are required to work in a group of either 2 or 3 people (4 people are allowed, but not recommended, and the expectations for the final product will be higher for 4-people groups). Although you will only have a few days to complete it, alongside attending lectures, this project will be larger in scale than the JavaScript project. Choose a project that requires sufficient skill to impress potential employers. Remember--you can always choose to continue adding features during your job search, but what you turn in needs to be a complete MVP.

The key goal of the flex project is to help differentiate you from other bootcamp grads, as well as from other App Academy students. With that said, here are a couple of directions you can choose to go with the flex project:

1. Build a project that adds to your tech stack:

* [Pixpy Pics](http://www.pixpy.tech/)
  * Built with Django/Python backend + React/Redux frontend (these students' cohort learned React/Flux)
* [Algo Arena](http://algorithm-arena.appspot.com/)
  * Node.js/Express backend
* [iPict](https://itunes.apple.com/us/app/ipict/id1155986338)

2. Create an app that solves a relevant problem

* [SafeScroll](https://chrome.google.com/webstore/detail/safescroll/lkkeaiancamiccigdofacokfdjegoanm/related)
  * Tips for [Chrome Extension](chrome-extension.md)
* [eos-redux](https://www.npmjs.com/package/eos-redux)
  * Tips for creating [gems, packages, or libraries](gem-or-library.md)
* [Prism](http://www.prismextension.com/)

3. Make something that leverages a cool library or works with different APIs

* [Cerebellum](https://mvelk.github.io/cerebellum/)
* [Uber on Slack](https://uberonslack.com/)

## Flex Project Pre-Proposal

Because the flex project is the first group project and also by far the largest-scale project students build while at App Academy, it is extremely important for you to invest heavily in the early planning stages.

Historically, there's a pretty strong correlation between how well-developed the project proposal is and how well the projects turn out. In addition, students that don't actually sufficiently plan out the flex project often times don't meet the flex project deadline, which can really hurt the start of your job search. Becuase of this trend, we'll be trying something new for this cohort. On Friday afternoon, we'll be dedicating the entire afternoon for you to start working on your **Flex Project Pre-Proposal**.

Basically, on W10D5, you will spend 9:00AM - 12:00pm working on on your pre-proposal. Your pre-proposal should contain:

* A general idea of what you are trying to build, along with the core functionalities/features of your application.
* Technologies that you'll be using.
* A few backup ideas (no need to put too much time into this, unless you really don't like you first choice).
* A detailed plan of how you will spend your weekend laying the ground work for your flex project.

At 1:30pm, each group will have about 10 minutes to chat with coaches about their pre-proposal. During this time, they'll receive feedback about their project as well as how they should be spending their time over the weekend.

## Flex Project Proposal

* Due W11D1 at 9am
* Similar to your JavaScript project, the proposal will be written as a `README.md` in a repo.
  * **Only one repo needed per team**
* Submit on Jobberwocky, even though only one repo needed, **every team member still needs to submit on Jobberwocky.**
  * Please share **only one** [flex scorecard](https://docs.google.com/spreadsheets/d/18tWMvVYWXgPqz0g7MwKQ3EGWKczxQaeTuISgfo34PqM/edit?usp=sharing) amongst all of your group members. Each group member should submit **the same scorecard URL** in Jobberwocky.
* On Jobberwocky, state who your teammates are in the 'To-do' section.
  * ie. "I'm on the same team as Greg Chamberlain." (please write full names)
* Required sections:
  * **Background and Overview**
  * **Functionality and MVP**
  * **Technologies and Technical Challenges**
  * **Things Accomplished Over the Weekend**
  * **Group Members and Work Breakdown**
    * Proposal must have a day-by-day breakdown **for each individual**. See sample proposal for clarification.
  * **Plan for getting users and reviews** (if your app is a downloadable app)
* Check out some sample proposals
  * [Sample Proposal for that implements Machine Learning and uses Django](./flex-sample-proposal2/README.md)
  * [Sample Proposal for a React Native App](https://github.com/JaredTan/Woven/tree/master/docs).

## Project Requirements

All projects need to have these elements:

* README - make sure it has:
  * Description of project, including goals
  * Link to live demo and/or instructions on how to use and run code
  * List of techs/languages/plugins/APIs used
  * Technical implementation details for anything worth mentioning (basically anything you had to stop and think about before building)
    * Include links to the neatest parts of the code, or embed snippets
    * Include screenshots of anything that looks pretty
    * A few example READMEs are linked from [this page][example-readmes]
  * To-dos and future features
* Make sure there's no .DS_Stores, node_modules, etc.
* If it is a non-live project (ie. Chrome extension, mobile app, slackbot, npm package), then it **is required** to have a demo page.
  * [Uber on Slack demo page](https://uberonslack.com/)
  * [VS Code Org Mode](https://jsonreeder.github.io/vscode-org-mode/)
* **If it is a mobile app**, then it must have a link to an emulator on the demo page.
  * [Demo Page with Emulator](https://jastack.github.io/demo_page/)
* Demo pages should be super simple. It's basically like making a [personal portfolio](../../application-materials/portfolio/portfolio.md), except for your project. Use templates, and keep it simple!
* Once complete, add the new project to your resume!

[example-readmes]: ../example-readmes.md

### Group Projects

When working in a group, make sure to make use of an effective [Github workflow](https://www.atlassian.com/git/tutorials/syncing).

* Do your work on feature branches.
* Regularly rebase or merge master into feature branch if master is being updated (at the very least, do this before submitting your pull request and before merging in your feature branch).
* When feature is complete, submit a Pull Request and assign it to a team member to review your code.
* Discuss code, make any necessary changes. When assigned team member approves the pull request, merge the feature branch into master.
