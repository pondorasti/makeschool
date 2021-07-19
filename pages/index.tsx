import Head from 'next/head'
import classNames from '@utils/classNames'

interface ICourseWebsite {
  name: string;
  description: string;
  instructor: string;
  link: string;
}

interface IConcentration {
  name: string;
  courses: ICourseWebsite[];
}

const concentrations: IConcentration[] = [
  { name: "Front End Web Concentration", courses: [
    { name: "FEW 1.1", description: "Foundation Web", instructor: "Dani", link: "/courses/FEW-1.1" },
    { name: "FEW 1.2", description: "Foundation JavaScript", instructor: "Dani", link: "/courses/FEW-1.2" },
    { name: "FEW 1.3", description: "Responsive Web Design", instructor: "Dani", link: "/courses/FEW-1.3" },
    { name: "FEW 2.1", description: "Writing JavaScript Libraries", instructor: "Dani", link: "/courses/FEW-2.1" },
    { name: "FEW 2.2", description: "Advanced CSS and Visual Design", instructor: "Dani", link: "/courses/FEW-2.2" },
    { name: "FEW 2.3", description: "Single Page Applications", instructor: "Dani", link: "/courses/FEW-2.3" },
    { name: "FEW 2.4", description: "React Native", instructor: "Dani", link: "/courses/FEW-2.4" },
    { name: "FEW 2.5", description: "Data & Visualization", instructor: "Dani", link: "/courses/FEW-2.5" },
    { name: "FEW 2.9", description: "GraphQL", instructor: "Dani", link: "/courses/FEW-2.9" },
    ]
  },
  { name: "Back End Web Concentration", courses: [
    { name: "BEW 1.1", description: "RESTful & Resourceful MVC Architecture", instructor: "Dani", link: "/courses/BEW-1.1" },
    { name: "BEW 1.2", description: "Authentication, Associations, & Advanced Queries", instructor: "Dani", link: "/courses/BEW-1.2" },
    { name: "BEW 1.3", description: "Server-Side Architectures & Frameworks", instructor: "Dani", link: "/courses/BEW-1.3" },
    { name: "BEW 2.1", description: "Advanced Web Patterns in Node.js", instructor: "Dani", link: "/courses/BEW-2.1" },
    { name: "BEW 2.2", description: "Docker, DevOps, & Deployments", instructor: "Dani", link: "/courses/BEW-2.2" },
    { name: "BEW 2.3", description: "Intro to Web Security", instructor: "Dani", link: "/courses/BEW-2.3" },
    { name: "BEW 2.4", description: "Decentralized Apps & Distributed Protocols", instructor: "Dani", link: "/courses/BEW-2.4" },
    { name: "BEW 2.5", description: "Go - Patterns & Practices in Strongly Typed Languages", instructor: "Dani", link: "/courses/BEW-2.5" },
    ]
  }
]

export default function Home() {
  const headerStyling = "border-b-1 uppercase text-left text-xs font-semibold tracking-wider p-3 text-gray-500 border-gray-500"
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
            <h3 className="text-2xl font-bold text-gray-900 tracking-tight sm:text-3xl mb-5">
              {concentration.name}
            </h3>

            <div className="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
              <table  className="min-w-full divide-y divide-gray-200">
                <thead>
                  <tr>
                    <th className={headerStyling}>Course</th>
                    <th className={headerStyling}>Description</th>
                    <th className={headerStyling}>Instructor</th>
                  </tr>
                </thead>
                <tbody>
                {concentration.courses.map((course, index) => (
                  <tr key={course.description} className={index % 2 === 0 ? 'bg-white dark:bg-gray-800' : 'bg-gray-50'}>
                    <td className={classNames("w-1/6", rowStyling)}>
                      <a className={linkStyling} href={course.link} target="_blank" rel="noreferrer">{course.name}</a>
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
