interface ILink {
  title: string
  href: string
  external?: boolean
}

export default function Footer(): JSX.Element {
  const links: ILink[] = [
    { title: "Badges", href: "/badges" },
    { title: "Institutional Plan", href: "/institutional-plan" },
    {
      title: "Student Handbook",
      href: "https://docs.google.com/document/d/1yRtpkb3wHVu9Vvxuv0HX1F-LQj69u7ZUp9QIXJqgw30/edit?usp=sharing",
      external: true,
    },
    {
      title: "Course Schedule",
      href: "https://docs.google.com/spreadsheets/d/1kLBcDhS3CH4YzdhTYX5ZbZL5_V6uUWyZps3UlaUq1Ss/edit?usp=sharing",
      external: true,
    },
    {
      title: "Digital Library",
      href: "https://docs.google.com/document/d/1NwnW67ddta7uM5nn3Jzoc-ZnWvh3KoPL4OMRI4qzPWw/edit?usp=sharing",
      external: true,
    },
  ]

  return (
    <footer>
      <div className="max-w-7xl mx-auto py-12 px-4 sm:px-6 md:flex md:items-center md:justify-between lg:px-8">
        <div className="flex flex-row flex-wrap lg:flex-nowrap md:items-center justify-center space-x-4 md:order-2">
          {links.map((link) => (
            <a
              key={link.title}
              href={link.href}
              className="text-base text-gray-400 hover:text-gray-600 whitespace-nowrap"
              rel={link.external ? "noopener noreferrer" : ""}
            >
              {link.title}
            </a>
          ))}
        </div>
        <div className="mt-8 md:mr-8 md:mt-0 md:order-1">
          <p className="text-center text-base text-gray-400 sm:whitespace-nowrap">
            &copy; 2021 Alexandru Turcanu, All rights reserved.
          </p>
        </div>
      </div>
    </footer>
  )
}
