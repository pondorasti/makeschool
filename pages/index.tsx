import Head from "next/head"
import classNames from "@utils/classNames"

interface ICourseWebsite {
  name: string
  description: string
  instructor: string
  link: string
}

interface IConcentration {
  name: string
  courses: ICourseWebsite[]
}

const concentrations: IConcentration[] = [
  {
    name: "Web Foundations (FEW & BEW)",
    courses: [
      {
        name: "WEB 1.0",
        description: "Web Foundations",
        instructor: "Meredith",
        link: "/courses/WEB-1.0",
      },
      {
        name: "WEB 1.1",
        description: "RESTful & Resourceful MVC Architecture",
        instructor: "Meredith",
        link: "/courses/WEB-1.1",
      },
    ],
  },
  {
    name: "Front End Web Concentration",
    courses: [
      {
        name: "FEW 1.2",
        description: "JavaScript Foundations",
        instructor: "Mitchell",
        link: "/courses/FEW-1.2",
      },
      {
        name: "FEW 2.1",
        description: "Writing JavaScript Libraries",
        instructor: "Mitchell",
        link: "/courses/FEW-2.1",
      },
      {
        name: "FEW 2.2",
        description: "Advanced CSS and Web Design",
        instructor: "Mitchell",
        link: "/courses/FEW-2.2",
      },
      {
        name: "FEW 2.3",
        description: "Single Page Web Applications",
        instructor: "Mitchell",
        link: "/courses/FEW-2.3",
      },
      {
        name: "FEW 2.4",
        description: "Native Development with JavaScript",
        instructor: "Mitchell",
        link: "/courses/FEW-2.4",
      },
      {
        name: "FEW 2.5",
        description: "Data Visualization & Web Graphics",
        instructor: "Mitchell",
        link: "/courses/FEW-2.5",
      },
      {
        name: "FEW 2.9",
        description: "Advanced Technical Seminar (GraphQL)",
        instructor: "Mitchell",
        link: "/courses/FEW-2.9",
      },
    ],
  },
  {
    name: "Back End Web Concentration",
    courses: [
      {
        name: "BEW 1.2",
        description: "Authentication, Associations, & Advanced Queries",
        instructor: "Dani",
        link: "/courses/BEW-1.2",
      },
      {
        name: "BEW 1.3",
        description: "Server-Side Architectures & Frameworks",
        instructor: "Dani",
        link: "/courses/BEW-1.3",
      },
      {
        name: "BEW 2.1",
        description: "Advanced Web Patterns in Node.js",
        instructor: "Dani",
        link: "/courses/BEW-2.1",
      },
      {
        name: "BEW 2.2",
        description: "DevOps, Deployment & Containers",
        instructor: "Dani",
        link: "/courses/BEW-2.2",
      },
      {
        name: "BEW 2.3",
        description: "Introduction to Web Security",
        instructor: "Dani",
        link: "/courses/BEW-2.3",
      },
      {
        name: "BEW 2.4",
        description: "Decentralized Apps & Distributed Protocols",
        instructor: "Dani",
        link: "/courses/BEW-2.4",
      },
      {
        name: "BEW 2.5",
        description: "Go - Patterns & Practices in Strongly Typed Ecosystems",
        instructor: "Dani",
        link: "/courses/BEW-2.5",
      },
    ],
  },
  {
    name: "Mobile Development",
    courses: [
      {
        name: "MOB 1.1",
        description: "Introduction to Swift",
        instructor: "Adriana",
        link: "/courses/MOB-1.1",
      },
      {
        name: "MOB 1.2",
        description: "Introduction to iOS Development in Swift",
        instructor: "Adriana",
        link: "/courses/MOB-1.2",
      },
      {
        name: "MOB 1.3",
        description: "Dynamic iOS Applications",
        instructor: "Adriana",
        link: "/courses/MOB-1.3",
      },
      {
        name: "MOB 2.1",
        description: "Local Persistence in iOS",
        instructor: "Adriana",
        link: "/courses/MOB-2.1",
      },
      {
        name: "MOB 2.2",
        description: "2D Mobile Game Development",
        instructor: "Adriana",
        link: "/courses/MOB-2.2",
      },
      {
        name: "MOB 2.3",
        description: "Concurrency & Parallelism in iOS",
        instructor: "Adriana",
        link: "/courses/MOB-2.3",
      },
      {
        name: "MOB 2.4",
        description: "Advanced Architectural Patterns in iOS",
        instructor: "Adriana",
        link: "/courses/MOB-2.4",
      },
      {
        name: "MOB 2.9",
        description: "Advanced Technical Seminar (MOB)",
        instructor: "Adriana",
        link: "/courses/MOB-2.9",
      },
    ],
  },
  {
    name: "Data Science",
    courses: [
      {
        name: "DS 1.11",
        description: "Introduction to Data Science Workflow",
        instructor: "Joseph",
        link: "/courses/DS-1.11",
      },
      {
        name: "DS 2.1",
        description: "Machine Learning",
        instructor: "Joseph",
        link: "/courses/DS-2.1",
      },
      {
        name: "DS 2.2",
        description: "Deep Learning",
        instructor: "Joseph",
        link: "/courses/DS-2.2",
      },
      {
        name: "DS 2.3",
        description: "Data Science in Production",
        instructor: "Joseph",
        link: "/courses/DS-2.3",
      },
      {
        name: "DS 2.4",
        description: "Core Applications of Artificial Intelligence",
        instructor: "Joseph",
        link: "/courses/DS-2.4",
      },
      // {
      //   name: "DS 2.5",
      //   description: "Natural Language Processing",
      //   instructor: "Joseph",
      //   link: "/courses/DS-2.5",
      // },
      {
        name: "DS 2.9",
        description: "Advanced Technical Seminar (DS)",
        instructor: "Joseph",
        link: "/courses/DS-2.9",
      },
    ],
  },
  {
    name: "Computer Science (Core)",
    courses: [
      {
        name: "CS 1.0",
        description: "Intro to Programming",
        instructor: "Joi",
        link: "/courses/CS-1.0",
      },
      {
        name: "CS 1.1",
        description: "Programming Fundamentals",
        instructor: "Joi",
        link: "/courses/CS-1.1",
      },
      {
        name: "CS 1.2",
        description: "How Data Structures Work",
        instructor: "Joi",
        link: "/courses/CS-1.2",
      },
      {
        name: "CS 1.3",
        description: "Core Data Structures and Algorithms",
        instructor: "Joi",
        link: "/courses/CS-1.3",
      },
      {
        name: "CS 2.1",
        description: "Advanced Trees & Sorting Algorithms",
        instructor: "Joi",
        link: "/courses/CS-2.1",
      },
      {
        name: "CS 2.2",
        description: "Advanced Recursion & Graphs",
        instructor: "Joi",
        link: "/courses/CS-2.2",
      },
    ],
  },
  {
    name: "Software Product Development",
    courses: [
      {
        name: "SPD 1.1",
        description: "Introduction to Software Development",
        instructor: "Braus",
        link: "/courses/SPD-1.1",
      },
      {
        name: "SPD 1.2",
        description: "Agile Product Development & UI/UX",
        instructor: "Braus",
        link: "/courses/SPD-1.2",
      },
      {
        name: "SPD 1.3",
        description: "Team Software Project",
        instructor: "Braus",
        link: "/courses/SPD-1.3",
      },
      {
        name: "SPD 1.41",
        description: "Engineering Careers 1: Communication & Interviewing",
        instructor: "Braus",
        link: "/courses/SPD-1.41",
      },
      {
        name: "SPD 1.5",
        description: "Engineering Careers 2: Management and Leadership",
        instructor: "Braus",
        link: "/courses/SPD-1.5",
      },
      {
        name: "SPD 2.1",
        description: "Industry Collaboration Project Part 1: Client Work",
        instructor: "Braus",
        link: "/courses/SPD-2.1",
      },
      {
        name: "SPD 2.2",
        description: "Industry Collaboration Project Part 2: Analytics & Growth",
        instructor: "Braus",
        link: "/courses/SPD-2.2",
      },
      {
        name: "SPD 2.3",
        description: "Testing and Architecture",
        instructor: "Braus",
        link: "/courses/SPD-2.3",
      },
      {
        name: "SPD 2.31",
        description: "Testing and Architecture",
        instructor: "Braus",
        link: "/courses/SPD-2.31",
      },
      {
        name: "SPD 2.41",
        description: "Onboarding into Companies",
        instructor: "Braus",
        link: "/courses/SPD-2.41",
      },
    ],
  },
  {
    name: "Misc Courses",
    courses: [
      {
        name: "QL 1.1",
        description: "Quantitative Reasoning",
        instructor: "Kami",
        link: "/courses/QL-1.1",
      },
    ],
  },
]

export default function Home(): JSX.Element {
  const headerStyling =
    "border-b-1 uppercase text-left text-xs font-semibold tracking-wider p-3 text-gray-500 border-gray-500"
  const rowStyling = "p-3 text-gray-900 whitespace-nowrap"
  const linkStyling = "text-blue-600"

  return (
    <div>
      <Head>
        <title>Make School</title>
        <meta name="description" content="An archive of anything Make School related, Courses, Labs..." />
      </Head>

      <main>
        <div className="text-center my-20">
          <h1 className="text-4xl tracking-tight font-bold text-gray-900 sm:text-5xl md:text-6xl">
            <span className="block">Hello again,</span>
            <span className="block text-blue-900 dark:text-blue-400">Make School</span>
          </h1>
        </div>

        {concentrations.map((concentration) => (
          <div key={concentration.name} className="mb-12">
            <h3 className="text-2xl font-bold text-gray-900 tracking-tight sm:text-3xl mb-5">{concentration.name}</h3>

            <div className="shadow overflow-x-auto border-b border-gray-200 sm:rounded-lg">
              <table className="min-w-full divide-y divide-gray-200">
                <thead>
                  <tr>
                    <th className={headerStyling}>Course</th>
                    <th className={headerStyling}>Description</th>
                    <th className={headerStyling}>Instructor</th>
                  </tr>
                </thead>
                <tbody>
                  {concentration.courses.map((course, index) => (
                    <tr
                      key={course.description}
                      className={index % 2 === 0 ? "bg-white dark:bg-gray-800" : "bg-gray-50"}
                    >
                      <td className={classNames("w-1/6", rowStyling)}>
                        <a className={linkStyling} href={course.link} target="_blank" rel="noreferrer">
                          {course.name}
                        </a>
                      </td>
                      <td className={classNames("w-3/5", rowStyling)}>{course.description}</td>
                      <td className={rowStyling}>{course.instructor}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        ))}
      </main>
    </div>
  )
}
