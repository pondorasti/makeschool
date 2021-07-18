import Head from 'next/head'

interface ICourseWebsite {
  name: string;
  description: string;
  instructor: string;
  link: string;
}

const courseWebsites: ICourseWebsite[] = [
  { name: "BEW 1.1", description: "RESTful & Resourceful MVC Architecture", instructor: "Dani", link: "/courses/BEW-1.1" },
  { name: "BEW 1.2", description: "Authentication & Associations", instructor: "Dani", link: "/courses/BEW-1.2" },
  { name: "BEW 1.3", description: "Server Side Architectures & Frameworks", instructor: "Dani", link: "/courses/BEW-1.3" },
  { name: "BEW 2.1", description: "Advanced Web Patterns", instructor: "Dani", link: "/courses/BEW-2.1" },
  { name: "BEW 2.2", description: "Docker DevOps Deployments", instructor: "Dani", link: "/courses/BEW-2.2" },
  { name: "BEW 2.3", description: "Web-Security", instructor: "Dani", link: "/courses/BEW-2.3" },
  { name: "BEW 2.4", description: "Decentralized Apps & Distributed Protocols", instructor: "Dani", link: "/courses/BEW-2.4" },
  { name: "BEW 2.5", description: "Go - Strongly Types Languages", instructor: "Dani", link: "/courses/BEW-2.5" },
]

export default function Home() {
  return (
    <div>
      <Head>
        <title>Make School</title>
        <meta name="description" content="An archive of anything Make School related, Courses, Labs..." />
      </Head>

      <main>
        <h1>Hello again, <br /> Make School</h1>
        <table className="table-auto w-full">
        <thead>
          <tr>
            <th>Course</th>
            <th>Description</th>
            <th>Instructor</th>
          </tr>
        </thead>
        <tbody>
        {courseWebsites.map((course) => (
          <tr key={course.description}>
            <td>
              <a href={course.link} target="_blank" rel="noreferrer">{course.name}</a>
            </td>
            <td>{course.description}</td>
            <td>{course.instructor}</td>
          </tr>
        ))}
        </tbody>
        </table>
      </main>
    </div>
  )
}
