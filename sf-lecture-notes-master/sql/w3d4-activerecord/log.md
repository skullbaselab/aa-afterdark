# W3D4 Lecture

  + 12/21/17
  + Lecturer: Kelly
  + Notes: Jesse

#### Notes
  + C.R.U.D.
    + Create Read Update Delete
  + N + 1
    + .includes is your friend
  + .pluck => runs select and map(returns an array) together under the hood

#### Questions
  + based on student's past hiring experiences do companies expect us to understand the underlying sql or just use these active record libraries
    + Both, Active Record is a powerful tool to make our code more expressive and DRYer but the understanding of SQL's principles and syntax structure is just as important. There will be times when raw SQL will be the only way to get the information that you need and where understanding how SQL works and interacts with your database will be more valuable than just understanding active record.
  + with "group(:id)"", how does group know that ":id" belongs to the id and not some other table
    + these shorthands are scoped under Question because we denote Question.method(arg).other_method(other_arg)
  + do these .joins refer to the table names or the association names?
    + the associations are a specific connection that we are utilizing to create the join
  + .pluck is not chainable like the other active record methods then?
    + not exactly since it returns an array proper as opposed to another Active Record Object



#### Notes
  + The __*_*__ previous result was something students did not know.
  + Figure out why the include for taught courses was spawning n + 1.





#### Questions
  + When you delete a record and recreate it again, which one would be the next primary key id?
    + It depends on implementation, but most of the time it will just continue on the next id, even if a previous (lower) id is now available.
  + What does CRUD stands for.
    + *CREATE* *READ* *UPDATE* and *DELETE*
  + Can we add other elements in __*pluck*__?
    + Yes, *__.pluck(:val, "count(\*)")__*
  + Is doing a pluck complexity *O(n)* ?
    + __To be checked__
