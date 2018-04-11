# cloudinary_demo

### How to Use this demo
* run `bundle install`
* run `figaro install`, this will create `config/application.yml`, which
  will allow us to easily set `ENV` variables
* get a cloudinary API key, cloud name, and upload preset
* in `application.yml` you will need the following:

```ruby
# config/application.yml
CLOUD_NAME: "cloud name goes here"
CLOUD_API_KEY: "api key goes here"
CLOUD_API_SECRET: "api secret goes here"
UPLOAD_PRESET: "upload preset goes here"
```
* I actually do the uploading in
  `assets/javascripts/views/images_index.js`

### How to use Cloudinary yourself
* make a `script src` to `http://widget.cloudinary.com/global/all.js`
* we are going to use [the upload widget][widget_doc]
* now we can call `cloudinary.openUploadWidget` from our JS code
* first argument is options, MUST specify `cloud_name` and
  `upload_preset` (you will need an upload preset from cloudinary
  settings page)
* second argument is callback, first arg is error, `NULL` if successful,
  second arg is result which includes `url`, `public_id`, etc
* now we can upload the `url` to rails right from the success callback
* if we want more sophisticated control, we need more than the `url`
* we need the `public_id` so we can request transformed versions of the
  image
* this will allow us to resize images for SUPER PERFORMANCE
* example: `http://res.cloudinary.com/my_cloud_name/image/upload/w_90,h_70/sample.jpg`
* that will resize the image on cloudinary and save the new version for future usage
* [examples of more transformations][transformations]

[widget_doc]: http://cloudinary.com/documentation/upload_widget
[transformations]: http://cloudinary.com/documentation/image_transformations#overview
