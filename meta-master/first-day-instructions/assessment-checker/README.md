# Assessment Checker

In order to find out if your machine will run the first few App Academy
assessments, please download the Gemfile in this directory. You can do
so by clicking `Gemfile` from the file list, and then **Raw** to
download it. Once you've acquired the Gemfile, navigate into the
directory where you've saved it:

In order to find out if your machine will run the first few App Academy
assessments, please follow these steps:

1. [Download this Gemfile][gemfile-raw]
2. Navigate to the directory where you saved the Gemfile:

    ```sh
    ~$ cd ~/Downloads
    ```

3. Run the following code:

    ```sh
    ~$ ruby -v
    ~$ gem install bundler
    ~$ bundle install
    ```

[gemfile-raw]: ./Gemfile?raw=true

Your Ruby version should be 2.3.1 (the exact release number doesn't
matter as much). If the `bundle install` succeeds, you're good to go:
you have the correct Ruby and gem versions installed, and can bring your
computer into the office to take the assessment. If you hit any snags,
refer back to the [Ruby setup instructions][ruby-setup] and try
searching Google for the error message. If all else fails, you'll be
welcome to use one of the school machines for the assessment. :)

[ruby-setup]: https://github.com/appacademy/dotfiles
