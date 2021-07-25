interface ICourseWebsite {
  name: string
  description: string
  instructor: string
  link: string
}

interface IConcentration {
  name: string
  description: string
  courses: ICourseWebsite[]
}
