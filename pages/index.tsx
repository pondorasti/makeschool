import Head from 'next/head'

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
  { name: "Back End Web Concentration", courses: [
    { name: "BEW 1.1", description: "RESTful & Resourceful MVC Architecture", instructor: "Dani", link: "/courses/BEW-1.1" },
    { name: "BEW 1.2", description: "Authentication & Associations", instructor: "Dani", link: "/courses/BEW-1.2" },
    { name: "BEW 1.3", description: "Server Side Architectures & Frameworks", instructor: "Dani", link: "/courses/BEW-1.3" },
    { name: "BEW 2.1", description: "Advanced Web Patterns", instructor: "Dani", link: "/courses/BEW-2.1" },
    { name: "BEW 2.2", description: "Docker DevOps Deployments", instructor: "Dani", link: "/courses/BEW-2.2" },
    { name: "BEW 2.3", description: "Web-Security", instructor: "Dani", link: "/courses/BEW-2.3" },
    { name: "BEW 2.4", description: "Decentralized Apps & Distributed Protocols", instructor: "Dani", link: "/courses/BEW-2.4" },
    { name: "BEW 2.5", description: "Go - Strongly Types Languages", instructor: "Dani", link: "/courses/BEW-2.5" },
    ]
  }
]

export default function Home() {
  const headerStyling = "border-b-[3px] uppercase text-left text-xs font-bold tracking-wider py-1 px-3 text-gray-500 border-gray-500"
  const rowStyling = "p-3 text-gray-900"
  const linkStyling = "text-blue-600"

  return (
    <div>
      <Head>
        <title>Make School</title>
        <meta name="description" content="An archive of anything Make School related, Courses, Labs..." />
      </Head>

      <main>
        <div className="text-center">
          <h1 className="text-4xl tracking-tight font-bold text-gray-900 sm:text-5xl md:text-6xl">
            <span className="block">Hello again,</span>
            <span className="block text-blue-900">Make School</span>
          </h1>
        </div>

        {concentrations.map((concentration) => (
          <div key={concentration.name}>
            <h3 className="text-2xl font-bold text-gray-900 tracking-tight sm:text-3xl">
              {concentration.name}
            </h3>
          
            <table  className="table-auto w-full mt-5">
              <thead>
                <tr>
                  <th className={headerStyling}>Course</th>
                  <th className={headerStyling}>Description</th>
                  <th className={headerStyling}>Instructor</th>
                </tr>
              </thead>
              <tbody>
              {concentration.courses.map((course) => (
                <tr key={course.description}>
                  <td className={rowStyling}>
                    <a className={linkStyling} href={course.link} target="_blank" rel="noreferrer">{course.name}</a>
                  </td>
                  <td className={rowStyling}>{course.description}</td>
                  <td className={rowStyling}>{course.instructor}</td>
                </tr>
              ))}
              </tbody>
            </table>
          </div>
        ))}
      </main>
    </div>
  )
}
