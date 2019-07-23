'use strict';
function test() {
  var employees = [
    { name: 'John', age: 35 },
    { name: 'Bill', age: 39 },
    { name: 'Amy', age: 27 },
    { name: 'Ivan', age: 27 }
  ];

  // printEmployees(employees);

  var person1 = {};
  person1.name = 'Petar';
  person1.age = 30;
  person1.qualifications = ['javascript', 'react', 'TDD'];

  var person2 = new Object();
  person2.name = 'Dimitar';
  person2.age = 40;
  person2.qualifications = ['C++', '.NET'];

  employees.push(person1, person2);

  var element = document.getElementById('results');

  function stringifyEmployees(emp){
    var i, result = '<ul type="square">';
    // for(i = 0; i < emp.length; i++) {
    //   result += '<li>' + emp[i].name 
    //     + ', age: ' + emp[i].age 
    //     + ', qualifications: ' 
    //     + (emp[i].qualifications ? emp[i].qualifications.join(', ') : 'N/A')
    //     + '</li>';
    // }
    result += emp.filter(employee => employee.age <= 35)
    // .sort((a, b) => a.age - b.age) // sort by age
    // .sort((a, b) => a.name.localeCompare(b.name)) //sort by name
    .sort((a, b) =>  a.age - b.age || a.name.localeCompare(b.name)) //sort by age then name
    .map(elem => '<li>' + elem.name 
          + ', age: ' + elem.age 
          + ', qualifications: ' 
          + (elem.qualifications ? elem.qualifications.join(', ') : 'N/A')
          + '</li>')
    .reduce((accum, elem) => accum + elem, '');
    // .join('\n');
    // .forEach(function(elem, index, array) {
    //   result += '<li>' + elem.name 
    //       + ', age: ' + elem.age 
    //       + ', qualifications: ' 
    //       + (elem.qualifications ? elem.qualifications.join(', ') : 'N/A')
    //       + '</li>';
    // });
    result += "</ul>";
    return result;
  }

  element.innerHTML = stringifyEmployees(employees);

  function Employee(aName, aPractice, qualifications) {
    this.name = aName;
    this.practice = aPractice || 0;
    this.qualifications = qualifications ? qualifications.split(/\s*,\s*/) : undefined;
    // this.toString = function() {
    //   return this.name + ', practice: ' + this.practice;
    // };
  }

  Employee.prototype.toString = function () {
    return this.name + ', years: ' + this.practice 
      + ', qualifications: ' + 
      (this.qualifications ? this.qualifications.map(function(q, i) {
        return i + "). " + this.name + ': ' + q;
      }).join(', ') : 'N/A');
  };

  var e1 = new Employee('Ivan', 0, 'Java    , JavaScript ,      XML');
  var e2 = new Employee('Petar', 5, 'JavaScript, XML, XPath, SOA, UML');
  var e3 = new Employee('Dimitar');
  element.innerHTML += '<p>' + e1.toString() + '</p><p>' + e2 + '</p><p>' + e3 + '</p>';


  // Homework: Create Programmer constructor extending Employee with multivalued property 
  // 'languages' and override toString method from Employee to print additional information 
  // - programming languages for the programmer instance.

}


