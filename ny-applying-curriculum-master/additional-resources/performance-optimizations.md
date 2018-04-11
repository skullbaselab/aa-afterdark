# Performance Optimizations Cheat Sheet

Read these two articles, and review this recap list. Even if you haven't implemented these optimizations, it will impress interviewers that you understand and care about performance.

* [Front-End Performance Rules][fe-performance]
* [browserdiet][browserdiet]

[fe-performance]: https://www.smashingmagazine.com/2016/12/front-end-performance-checklist-2017-pdf-pages/
[browserdiet]: http://browserdiet.com/en/

## Ways to Improve Performance

**DB layer**

* Index lookup columns (see lol_dba and rack-mini-profiler)
* Order indices to start from the most selective columns
* Denormalize the schema (only worth it for huge performance gains)
* Use NoSQL for non-crucial data.

**Application layer**

* Cache DB queries (see Russian Doll Caching)
* Use ActiveRecord counter cache
* Use a faster server
* Trade more space for less time in your code
* Cache rendered views
* Avoid N+1 queries
* Paginate long results
* Use background jobs for anything that doesn't have to be done immediately (e.g. for email)
* Use Adequate Record (Rails 4.2 only) to add extra caching
* Favor Model#pluck to avoid the overhead of creating Active Record models when you can avoid it
* In views, order records by primary key instead of created_at (it’s faster and almost equivalent)
* [Use a multithreaded server (see Puma)]
* Add RAM to your server
* Upgrade Ruby version if you’re using an old one
* Flush the buffer right after \</head>
* Use several servers and a load-balancer

**Network**

*Server-side*

* Load third-party assets through a CDN
* Use a reverse proxy server like Varnish
* Limit number of different hostnames but split components across hostnames
* Prefer GET to POST requests where it makes sense
* Minimize cookie sizes
* Preload components
* Replace redirects with Alias and mod_rewrite
* Use servers that are close to your users
* Uptime Robot (Heroku-specific)

*Client-side*

* Keep components under 25k for iPhones so they can be cached
* Enable asset caching with ETags, or remove ETags altogether
* Configure cache-control Headers
* Weed out predictable 404s from unavailable assets
* Minify assets
* Concatenate assets
* Use CSS Sprites
* Gzip components (see Rack::Deflater)

**Frontend**

*Assets*

* Avoid CSS-embedded Javascript
* Avoid redundant CSS rules
* Don’t use inline CSS or JS if those assets are big enough to be cached
* Tag scripts as async if you don’t care what order they’re executed in or if they’re from 3rd parties
* Don’t use @import for CSS
* Limit third-party JS libraries to what you need (e.g. jQuery.ui.sortable.js vs. jQuery.ui.all.js)

*Markup*

* Put stylesheets at the top
* Put scripts at the bottom (unless one does some writing to the body)
* Limit the number of DOM elements (see document.getElementsByTagName(‘*’).length)

*Images*

* Inline images
* Limit image sizes to just the size and resolution needed on the page

*Javascript*

* Limit script interactions with the DOM
* Replace JS logic with CSS transforms
* Use vanilla JS for standardized DOM manipulations
* Load more async data after main page is loaded
* Cache array lengths inside for loops
* Don’t modify class attributes on the fly

*User Perception*

* Use loading animations
* Use progressive JPEGs
* Use [isomorphic JavaScript][isomorphic] to pre-generate initial DOM on the server-side (e.g., React, Meteor)

[isomorphic]: http://nerds.airbnb.com/isomorphic-javascript-future-web-apps/

## Tools to Find Bottlenecks

**At the DB Layer**

* [lol_dba][lol_dba]
* [rack-mini-profiler][rack-mini-profiler]

[lol_dba]: https://github.com/plentz/lol_dba
[rack-mini-profiler]: https://github.com/MiniProfiler/rack-mini-profiler

**At the Application Layer**

* Benchmark module
* [bullet][bullet]

[bullet]: https://github.com/flyerhzm/bullet

**On the Frontend**

* [Mobile-Friendly][pagespeed]

[pagespeed]: https://search.google.com/search-console/mobile-friendly

**Across the Stack**

* Chrome DevTools
* YSlow
* New Relic

## Deep Dive Reading
* [High Performance Browser Networking][high-perf-browser]

[high-perf-browser]: https://hpbn.co/
