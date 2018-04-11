## Auth

* Let’s say you want to make Amazon.com.

* Using what we’ve built so far, how would you make stateful, secret, secure carts?

* Well, one idea might be to make a unique thing to put in the query string. Like ?user=123. But that’s clearly unsafe.

* What about a random code? Like 2309u22jf092j39f0u which is the unique identifier for their session. Well, no, that has a lot of problems too; easy to steal, look up in the history, send accidentally in a link, etc.

* We want to do something better. In fact, what we want is persistence across connections. This is something inherent to the design of the Internet. This is what it means that HTTP is stateless. We want persistence across requests, and that requires cookies.

* 4KB per cookie, 20 cookies per domain, key-value pairs. Domains don’t get to look at each other’s cookies. They get sent up in the headers both on request and response. The cookies also come with expiration dates. They may expire when the browser window closes, or they may expire in 30 years.

* So we’ve got some stuff figured out. What about authentication?

* Let’s use usernames and passwords. But how do we store this stuff in the database?

* Plaintext is no good. So maybe we encrypt it. Encoding is bad, because it can be straightforwardly decoded. Encryption is bad because if we get busted, EVERYTHING gets decrypted. Hashing is the solution.

* So let’s look at BCrypt and see how it solves this problem. BCrypt the shit out of everything on stage.

* But oh no, rainbow tables! Salt dem shits. Done.

* Session tokens stored in the database, reset every time a new session is made. That’s the auth pattern.

* OWASP Top 7 Security Problems: HTML injection (XSS) and CSRF attacks (prevented using form_authenticity_token)

* Flash, flash.now, and the session (access to permanent cookies).

* Go over Auth pattern. Now you’re done.
