# Singleton topics

### Why would we use a singleton?

* Singletons are useful to memory conservation

### What can we put in a singleton?

* We do not want to put mutable features into a singleton
* Singletons should operate as static placeholders

### What is a module? (Singletons are added via module)

* A module is similar to a library
* A module adds/overwrites a number of methods when added to a class

### What methods does the Singleton overwrite? 

* An error will be raised with #new is called 
* An error will be raised is #dup is called
* #Instance is added for populating files with the Singleton