class Student {

  constructor(fname, lname){

    this.fname = fname;
    this.lname = lname;
    this.courses = [];
  }

  // This is the same as adding a method directly
  // to the Student prototype with ES5 (syntactic sugar :) )
  name(){
    // debugger;
    return `${this.fname} ${this.lname}`;
  }

}

// We leverage ES6 syntax above to rewrite the student name method
// Student.prototype.name = function(){
//   return `Whats uuuuup`;
// };

Student.prototype.enroll = function (course) {
  // debugger;
  if (!this.courses.includes(course)) {
    this.courses.forEach(crs => {
      if (crs.conflictsWith(course)) {
        console.error('Error: Course conflict');
      }
    });

    this.courses.push(course);
    course.addStudent(this);
  }
  return this.fname + ' successfully enrolled';
};

Student.prototype.courseLoad = function () {
  const courseLoad = {};

  this.courses.forEach(course => {
    let dpt = course.department;
    courseLoad[dpt] = courseLoad[dpt] || 0;
    courseLoad[dpt] += course.credits;
  });

  return courseLoad;
};

function Course (name, department, credits, days, block) {
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.days = days;
  this.block = block;
  this.students = [];
}

Course.prototype.addStudent = function (student) {
  if (this.students.includes(student)) {
    this.students.push(student);
    student.enroll(this);
  }
};

Course.prototype.conflictsWith = function (other) {
  if (this.block !== other.block) { return false; }

  return this.days.some(day => other.days.includes(day));
};

function celebrate () {
  console.log('Yaaaaaaaaaaaassss!');
}

// celebrate.call(null);

function add (n1, n2) {
  return n1 + n2;
}

// Fourth & fifth ways to invoke a method
// 'call' & 'apply'
// With call & apply, we can pass the context for the method as an argument
// console.log(add.call(null, 3, 4));
// console.log(add.apply(null, [3, 4]));

// callbacks are ALWAYS invoked Function Style
// remember, callbacks are function objects :)
function theInvoker (cb) {
  // debugger;
  return cb();
}

// Invoking Function Style | no context is supplied
// celebrate();
// theInvoker(celebrate);

// Invoking Constructor Style
// 'new' sets up an empty object and builds the following object
let danny = new Student('Danny', 'Catalano');
// let ali = new Student('Ali', 'Harris');

// debugger;
// const detachedNameFunc = ali.name;

// the below supplies the necessary context due to the method invocation!
// but seems a biiit like overkill and weird...
const betterDetachedNameFunc = function() {
  // debugger;
  console.log(ali.name());
};

// aaaaay bind to save the day!
// const bestDetachedNameFunc = ali.name.bind(ali);
// console.log(ali.name.bind(ali).bind(danny));
// console.log(bestDetachedNameFunc());

// BUT WHY BINDING & CALLBACKS???!?!
// call backs become increasingly important as we enter
// building for the web and handling events ( Stay Tuned... )

// Note: Fat Arrow functions will  automatically be bound
// to the context in which it was defined

function saveStudentCourseToDB(enrollCallback, course) {
  console.log('Enrolling in course ' + course.name + '...');
  try {
    const result = enrollCallback(course);
    console.log(result);
  } catch (e) {
    console.log('something went wrong');
    console.log(e);
  }
}


// console.log(theInvoker(bestDetachedNameFunc));

let course1 = new Course('101', 'CS', 3, ['mon', 'wed', 'fri'], 1);
let course2 = new Course('201', 'CS', 3, ['wed'], 1);
let course3 = new Course('301', 'ENG', 3, ['tue'], 1);
let course4 = new Course('401', 'BIO', 3, ['mon', 'wed', 'fri'], 2);

saveStudentCourseToDB(danny.enroll.bind(danny), course1);

// Invoking Method Style
// dot invocation with the context to the left

// danny.enroll(course1);
// danny.enroll(course3);
// ali.enroll(course2);
// ali.enroll(course4);
