
class Person {
	name: string
	age: number

	constructor(name, age) {
		this.name = name 
		this.age = age
	}

	describe(): string {
		return `${this.name} is ${this.age}`
	}
}

const joe = new Person('Joe', 33)

// Define a Course. A Course a title: string and a units: number

class Course {

}

// Define a Student class. Student extends Person. A Student 
// has an array of Courses and a cohort which is: junior or senior

// Add enroll method that takes a Course as parameter and adds 
// this to the course array

class Student {

}



export default Person
export {
	Course, 
	Student
}



