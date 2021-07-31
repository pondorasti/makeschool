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

interface ITutorial {
  title: string
  teaser_text: string
  cover: string
  slug: string
  first_page: string
}
