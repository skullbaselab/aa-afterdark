# Application Layout

```html+erb
    <nav class="navbar navbar-default" role="navigation">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">Bootstrap</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav nav-pills nav-links">
            <li class="active"><a href="/">Home</a></li>
          </ul>

          <% if signed_in? %>
          <% else %>
          <% end %>

        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>

    <% if flash[:errors] %>
    <% end %>
```

# Home Page

```html
<div>
  <h1>Welcome to Star Trek Bad Asses</h1>
  <div>
    <div>
Pea horseradish azuki bean lettuce avocado asparagus okra. Kohlrabi radish okra azuki bean corn fava bean mustard tigernut jÃ­cama green bean celtuce collard greens avocado quandong fennel gumbo black-eyed pea. Grape silver beet watercress potato tigernut corn groundnut. Chickweed okra pea winter purslane coriander yarrow sweet pepper radish garlic brussels sprout groundnut summer purslane earthnut pea tomato spring onion azuki bean gourd. Gumbo kakadu plum komatsuna black-eyed pea green bean zucchini gourd winter purslane silver beet rock melon radish asparagus spinach.
    </div>
    <div>
Beetroot water spinach okra water chestnut ricebean pea catsear courgette summer purslane. Water spinach arugula pea tatsoi aubergine spring onion bush tomato kale radicchio turnip chicory salsify pea sprouts fava bean. Dandelion zucchini burdock yarrow chickpea dandelion sorrel courgette turnip greens tigernut soybean radish artichoke wattle seed endive groundnut broccoli arugula.
    </div>
  </div>
</div>

<h2>The Metal</h2>

<div>
  <div>
    <div class="feature-photo">
      <img src="http://www.advanceair.net/news/wp-content/uploads/2012/10/Star-Treck-picard.jpg">
    </div>
    <h3>Picard</h3>
    <p>
Beef tongue flank pork chop drumstick pork belly pastrami fatback filet mignon ham short loin pig bresaola. Doner chuck pork chop, shank prosciutto venison pastrami drumstick strip steak jerky porchetta flank tri-tip meatball brisket. Tongue swine hamburger ham drumstick tenderloin. Turducken beef ground round turkey. Flank landjaeger biltong kevin venison capicola chuck.
    </p>
  </div>
  <div>
    <div class="feature-photo">
      <img src="http://images2.fanpop.com/image/photos/13600000/Benjamin-Sisko-benjamin-sisko-13605618-694-530.jpg">
    </div>
    <h3>Sisko</h3>
    <p>
    Bresaola pork jowl meatloaf, beef pastrami landjaeger pork belly ham hock leberkas biltong tri-tip venison. Tail beef doner chuck pig capicola ham. Fatback kevin brisket filet mignon hamburger. Ribeye andouille pancetta chuck turkey prosciutto, cow t-bone rump beef pork loin strip steak porchetta jerky. Pork belly drumstick salami, porchetta short loin tri-tip pastrami pork prosciutto brisket chicken shoulder.
    </p>
  </div>
  <div>
    <div class="feature-photo">
      <img src="http://www.startrek.com/legacy_media/images/200307/worf06/320x240.jpg">
    </div>
    <h3>Worf</h3>
    <p>
    Shank pastrami filet mignon spare ribs sirloin tri-tip turducken, ground round frankfurter boudin beef drumstick. Ball tip ground round kevin doner pig sausage, ham beef. Landjaeger ball tip fatback, cow andouille filet mignon spare ribs bacon drumstick beef ribs chicken salami. Tenderloin rump turkey short loin, ribeye capicola shoulder venison frankfurter sausage. Tail short loin shankle bacon drumstick.
    </p>
  </div>
  <div>
    <div class="feature-photo">
      <img src="http://images4.fanpop.com/image/photos/15000000/Seven-seven-of-nine-15093087-2560-1600.jpg">
    </div>
    <h3>Seven of Nine</h3>
    <p>
Andouille filet mignon ribeye shoulder. Andouille ball tip shank, frankfurter filet mignon corned beef biltong kielbasa tenderloin ribeye. Pork fatback drumstick ball tip pastrami shankle boudin ground round meatloaf beef ribs chuck andouille filet mignon. Meatball brisket ground round t-bone, tongue bresaola biltong. Frankfurter tri-tip jerky ground round, jowl ham turkey sirloin pancetta leberkas andouille shoulder.
    </p>
  </div>
</div>
```

# Contact Modal Body

```html
            <div class="form-group">
              <label for="contact-email">Email</label>
              <input type="text" id="contact-email" class="form-control" />
            </div>
            <div class="form-group">
              <label for="contact-message">Message</label>
              <textarea id="contact-message" class="form-control"></textarea>
            </div>
```

# application.js

```javascript
$(function() {
  var $contactModal = $('#contact-modal'),
      $contactLink = $('#contact-link');
  $contactLink.on('click', function() {
    $contactModal.modal();
  });
});
```

# application.css.scss

```css
$body-bg: #2B3E50;
$brand-primary: #DF691A;
$gray-light: #4E5D6C;
$gray-lighter: #EBEBEB;
$jumbotron-bg: $gray-light;
$navbar-default-bg: $gray-light;
$text-color: $gray-lighter;
$navbar-default-color: $text-color;
$navbar-default-link-color: $text-color;
$navbar-default-link-active-color: $navbar-default-link-color;

$modal-content-bg: $body-bg;


@import "bootstrap";

.feature-photo {
  height: 210px;
}

.user-drop-down,
.sign-in-btn {
  margin-top: 7px;
}
```
