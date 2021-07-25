import classNames from "@utils/classNames"
import concentrations from "./config"

export default function Concentrations(): JSX.Element {
  const headerStyling = "uppercase text-left text-xs font-semibold tracking-wider p-3 text-gray-500"
  const rowStyling = "p-3 text-gray-900 whitespace-nowrap"
  const linkStyling = "text-blue-600 hover:text-blue-700 hover:underline"

  return (
    <>
      {concentrations.map((concentration) => (
        <div key={concentration.name} className="mb-12">
          <h3 className="text-2xl font-bold text-gray-900 tracking-tight sm:text-3xl mb-5">{concentration.name}</h3>
          <h3 className="text-gray-900 mb-5">{concentration.description}</h3>
          <div className="shadow-lg overflow-x-auto border border-gray-200 rounded-lg">
            <table className="min-w-full">
              <thead className="border-b border-gray-200">
                <tr>
                  <th className={headerStyling}>Course</th>
                  <th className={headerStyling}>Description</th>
                  <th className={headerStyling}>Instructor</th>
                </tr>
              </thead>
              <tbody>
                {concentration.courses.map((course, index) => (
                  <tr key={course.description} className={index % 2 === 0 ? "bg-white dark:bg-gray-800" : "bg-gray-50"}>
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
    </>
  )
}
