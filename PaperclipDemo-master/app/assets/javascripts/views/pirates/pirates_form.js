PaperclipDemo.Views.PiratesForm = Backbone.View.extend({

  template: JST['pirates/form'],
  
  events: {
      "submit form" : "submit",
      "change input[type=file]" : "encodeFile"
  },
  
  render: function () {
      var content = this.template();
      
      this.$el.html(content);
      return this;
  },

  encodeFile: function (event) {
      var that = this;
      var file = event.currentTarget.files[0];
      
      console.log(file);
      
      var reader = new FileReader();
      reader.onload = function(e) {
          console.log(e.target.result);
          that.model.set({ beard_photo: e.target.result });
      }
      reader.onerror = function(stuff) {
          console.log("error", stuff)
          console.log (stuff.getMessage())
      }
      reader.readAsDataURL(file);
  },

  submit: function (event) {
      event.preventDefault();
      
      var attrs = $(event.currentTarget).serializeJSON();
      this.model.set(attrs);
      PaperclipDemo.pirates.add(this.model, {
          success: function (attribute) {
              console.log("happy days!");
          },
      });
      this.model.save(null, {
          success: function () {
              window.location.assign("/pirates");
          },
      });
  },
});
