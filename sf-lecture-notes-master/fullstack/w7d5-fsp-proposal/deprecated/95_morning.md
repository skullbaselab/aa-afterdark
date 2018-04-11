# Scaling and Performance

Overview:
  * Internet Architecture & the Request-Response Lifecycle
  * Client-Side Performance

FTW in order of lowest to highest hanging fruit
  - add indexes: lol_dba (lol_dba db:find_indexes)
  - newrelic/pingdom
  - n+1 queries: bullet
  - switch to thin
  - paginate
  - config.ru rackdeflate

1) what happens when a page loads?
see people ask this: https://github.com/darcyclarke/Front-end-Developer-Interview-Questions
http://igoro.com/archive/what-really-happens-when-you-navigate-to-a-url/
http://friendlybit.com/css/rendering-a-web-page-step-by-step/
  I. DNS
  - is this in the browser dns cache
  - is this in the os dns cache
  - router cache
  - isp dns cache
  - talk about dns prefetching
  * demo make a dns request (show in wireshark)
  II. Use the ip(s)
  - round robin dns
  - load-balancer
  III. Browser constructs http request
  - GET /quotes HTTP/1.1 (probably one packet)
  IV. Server gets request
  - Router parses request
  - Initializes controller
  - Calls controller action
  - Accesses database with a search
  - Compiles a template with data
  - Generates response with metadata and response body
  - Sends response back to browser
  V. Browser parses response
  - DOM tree is built from html
  - New requests are made for each new resource as the tree is built
  - Stylesheets are parsed and styles are attached to nodes
  - Javascript is parsed and executed
    - DOM and css form a Frame tree (which goes through reflows and paints)
  - Browser renders page on screen

## Internet Architecture & the Request-Response Lifecycle

URL -> DNS -> IP -> TCP -> HTTP

URL: protocol, port, domain, resource, query string, fragment
http://facebook.com:80/posts?top=10/#/show

DNS: domain name -> IP address
* Lookup
* A-Record, CNAME
  + CNAME is an alias
  + A-Record points to an ip
* Caching
* Reduce DNS Lookups/Split Components Across Domains
* Multiple DNS servers (geographic locality, i.e. Google) + round robin

HTTP -> TCP/IP -> Ethernet -> Wire (+ OSI model)
* Browser creates HTTP request
* Broken into TCP segments
* Packaged into IP packets (one TCP segment per packet)
* Broken into Ethernet frames

TCP vs. UDP
* TCP - Transmission Control Protocol:
  * Guaranteed (i.e. acknowledged) and ordered transmission
  * HTTP uses TCP
  * High reliability
  * Error checking
  * Flow control
* UDP - User Datagram Protocol:
  * Send and forget
  * Better for time-critical, esp. when old packets don't matter (games, live stream)

## Client-Side Performance

Expensive operations:
* HTTP Requests
  * Assets
  * Cookies
  * Preloading, postloading
* Touching the DOM

### [Yahoo Rules](http://developer.yahoo.com/performance/rules.html)
 80-90% of the end-user response time is spent downloading all the components

* Minimize HTTP Requests
  + Combine files
  + CSS Sprites
  + Image maps
  + inline images

* Use a Content Delivery Network (CDN) W
  + first distribute static content (no web app redesign)
  + fewest hops or quickest response times
  + reduced response times for yahoo apps by about 20%

* Add an Expires or a Cache-Control Header C
  + browsers and proxies can use to decrease number of requests
  + browsers dont need to re-request resource

* Add 304 with if modified since and last modified, if none match
  + browser will request and server will respond with no body

* Gzip Components/Minify JavaScript and CSS C

* Put Stylesheets at the Top W
  + want initial page load to be styled
  + header navbar logo serve as visual feedback to make the page appear faster

* Put Scripts at the Bottom W
  + scripts block parallel downloads

* Avoid CSS Expressions/Choose <link> over @import/Avoid Filters C
  + background-color: expression( (new Date()).getHours()%2 ? "#B8D4FF" : "#F08A00" );
  + CSS is evaluated every time the mouse moves or the page is scrolled

* Make JavaScript and CSS External W
  + depends on number of pages using that css (might be faster to inline if only one page uses it like a welcome page)
  + content security

* Avoid Redirects C
  + most common unknown redirect is trailing slash
  + dmc/api/ratings# vs dmc/api/ratings/#

* Remove Duplicate Scripts C
  + 2 of top 10 sites have duplicate script tags

* Configure ETags C
  + `etags` + `fresh_when` + `stale?`
  + string that uniquely id's components
  + could be a hash of content, last modified timestamp
  + inode-size-timestamp (apache, nginx)
  + dangerous because inode changes between two identical filesystems

* Post-load Components (the non bootstrap way) C

* Reduce the Number of DOM Elements W
  + check with document.getElementsByTagName('*').length

* Reduce Cookie Size C
  + talk about "OH! i can store entire objects in the cookie!"
  + keep in mind scope of the cookie

* Use Cookie-free Domains for Components (static.example.com) W
* Minimize DOM Access W
* Develop Smart Event Handlers C
* Don't Scale Images in HTML/Optimize CSS Sprites/Optimize Images W
* Keep Components under 25K C
  + iphone will not cache components larger than 25K
























This stuff is now talked about in algorithms curriculum

## Scaling Data

* Master/Slave mirroring
* Caching
* Functional separation (Service-Oriented Architecture - SOA)
  * Dynamodb/columnar
* Sharding
* Denormalization
* Hadoop, Hadoop Distributed File System, MapReduce
* CAP theorem
* Index

## Scaling Servers

* Proxy servers / Load balancers
  * Nginx, HAProxy
* Multiple app servers
  * Multithreaded vs Evented
  * AWS - EC2, other free tier services

