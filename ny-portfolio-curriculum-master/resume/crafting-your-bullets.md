# Crafting Resume Bullets

Resumes demonstrate to a recruiter that you possess specific skills. Recruiters won't spend more than a few seconds on a resume that doesn't include keywords and relevant technologies.

## Steps to take

1. Identify a key skill that you will demonstrate. See [this list][keywords] for ideas.
2. Answer the following for each bullet:
  * What did I do?
  * How does it demonstrate the key skill?
  * What was the impact or benefit?

Compile a list of the skills you want to demonstrate, then craft your bullets around them.

## Example 1 (Non technical)
__Skill to Demonstrate__: Leadership

__What did I do?__: Founded company softball team

__How does it demonstrate the key skill?__: Took initiative. Organized long-term project.

__What was the impact or benefit?__: Improved team morale and collaboration.

__Result__: "Founded and managed company softball team, resulting in improved morale and communication among department."

## Example 2 (Technical)
__Skill to Demonstrate__: Scaling an App

__What did I do?__: Stored images in the cloud.

__How does it demonstrate the key skill?__: Shows I know how to use AWS S3.

__What was the impact or benefit?__: Reduces server load and allows for scale.

__Result__: "Stored image uploads in the cloud using AWS S3, reducing server load and allowing app to scale gracefully."

## Example 3 (Technical)
__Skill to Demonstrate__: Use of Third-Party API.

__What did I do?__: Determine user locations and filter searches.

__How does it demonstrate the key skill?__: Shows I know how to use the Google Maps API.

__What was the impact or benefit?__: Allows users to search for each other based on location

__Result__: "Integrated Google Maps API for geolocation based searching to display location of other users on a map."


### To help get you brainstorming:

* Did you find some clever way to DRY up your code?
* Did you bootstrap some data to avoid extraneous AJAX requests?
* Did you make some tough choices in your database schema?
* Did you use cookies to store anything other than a session token?
* Does your JavaScript use any math to resize something in the DOM?
* Did you use a library in a way that its author probably didn't anticipate?
* Did you write any custom SQL queries to optimize performance?
* Did you make any trade-offs related to performance, eg. store information that's costly to compute?
* Are you doing any caching?

When answering these questions, the key is to point out features you built that went **above and beyond the basic requirements**.

### Example bullet points:

* Leveraged Cloudinary to cache different sizes of images, resulting in better performance.
* Uses observer pattern to handle management of global Z-indexes for overlapping items.
* Lowers latency of DB read/write by factor of 7 by using Unicorn to enable virtual multi-threaded processing.
* Utilized Redis key-value storage to cache bearer tokens from Uber and Slack, allowing for O(1) lookup.
* Generates dynamic gameplay in HTML5 canvas element by utilizing vector math for game state updates.
* Parses XML Bart API responses to obtain departure/arrival information and give real-time advisories per query.

[keywords]: https://github.com/appacademy/ny-portfolio-curriculum/blob/master/resume/resume-keywords.md
