// This is a manifest file that'll be compiled into application.js,
// which will include all the files listed below.
//
// Any JavaScript/Coffee file within this directory,
// lib/assets/javascripts, vendor/assets/javascripts, or
// vendor/assets/javascripts of plugins, if any, can be referenced
// here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll
// appear at the bottom of the compiled file.
//
// Read Sprockets README
// (https://github.com/sstephenson/sprockets#sprockets-directives) for
// details about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.serializeJSON
//= require underscore
//= require backbone
//= require marked
//= require todo
//= require_tree ./models
//= require_tree ./collections
// We need templates to required before the views, because JST needs
// to be defined when we define the view prototype's `template`
// property.
//= require_tree ../templates
//= require_tree ./views
//= require_tree ./routers

// We don't need turbolinks where we're going! Also, they will break
// things in Rails 4 :-)
// require turbolinks
