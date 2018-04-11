var React = require('react'),
    ReactDOM = require('react-dom'),
    UploadButton = require("./components/UploadButton"),
    ImageList = require("./components/ImageList");

var Images = React.createClass({
  getInitialState: function () {
    return { images: [] };
  },
  componentDidMount: function () {
    $.get("/api/images", function (images) {
      this.setState({images: images});
    }.bind(this))
  },
  postImage: function (image) {
    var data = {image: {url: image.url}};
    $.post("/api/images", data, function (savedImage) {
      var images = this.state.images;
      images.push(savedImage);
      this.setState({ images: images });
    }.bind(this));
  },
  render: function () {
    return (
      <div>
        <UploadButton postImage={this.postImage}/>
        <ImageList images={this.state.images}/>
      </div>
    );
  }
});
document.addEventListener( 'DOMContentLoaded', function () {
  ReactDOM.render(
    <Images/>,
    document.getElementById('root')
  );
}, false );
