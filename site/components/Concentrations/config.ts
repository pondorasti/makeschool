const concentrations: IConcentration[] = [
  {
    name: "Web Foundations",
    description:
      "Prerequisite courses for all students. Understand the architecture of web applications, creating modular applications, professional best practices, request-response cycle, server-side templating, APIs, databases & unit testing, language-independent web server frameworks, and patterns in full-stack web design.",
    courses: [
      {
        name: "WEB 1.0",
        description: "Web Foundations",
        instructor: "Mitchell, Meredith",
        link: "/courses/WEB-1.0",
      },
      {
        name: "WEB 1.1",
        description: "Web Architecture",
        instructor: "Meredith",
        link: "/courses/WEB-1.1",
      },
    ],
  },
  {
    name: "Front End Web Concentration",
    description:
      "Create meaningful user experiences, interact directly with users to collect valuable feedback, build visualizations of data, and design amazing modes of user interaction for web, mobile, and desktop applications.",
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
        instructor: "Mitchell, Meredith",
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
    description:
      "Learn the patterns, practices, and paradigms that ensure you can use, develop, and release standardized server-side applications. Work with syntactic language features, web applications and APIs, deployment, web security, and scaling. ",
    courses: [
      {
        name: "BEW 1.2",
        description: "Authentication, Associations, & Advanced Queries",
        instructor: "Meredith",
        link: "/courses/BEW-1.2",
      },
      {
        name: "BEW 1.3",
        description: "Server-Side Architectures & Frameworks",
        instructor: "Dani, Meredith, Mitchell",
        link: "/courses/BEW-1.3",
      },
      {
        name: "BEW 2.1",
        description: "Advanced Web Patterns in Node.js",
        instructor: "Braus, Dani",
        link: "/courses/BEW-2.1",
      },
      {
        name: "BEW 2.2",
        description: "DevOps, Deployment & Containers",
        instructor: "Dani, Jay",
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
    description:
      "Learn the theory and application of the entire product development process for creating interactive mobile iOS applications. Work with Swift, and advanced frameworks used in industry along with mobile-specific programming paradigms.",
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
    description:
      "Learn to understand, process, visualize and extract value from data through analysis, building appropriate models to predict unseen data, use data with neural networks to mimic human perception, and implement recommendation systems.",
    courses: [
      {
        name: "DS 1.1",
        description: "Data Analysis & Visualization",
        instructor: "Joseph, Jess",
        link: "/courses/DS-1.1",
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
        instructor: "Joseph, Jess",
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
        instructor: "Braus, Mitchell, Joseph",
        link: "/courses/DS-2.4",
      },
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
    description:
      "How computers work. The fundamentals of programming, software development. Starting with the basics like variables, conditionals, and loops and building further into complex algorithms, advanced data structures, graph theory, and other programming concepts.",
    courses: [
      {
        name: "CS 1.0",
        description: "Introduction to Programming",
        instructor: "Joi, Jess",
        link: "/courses/CS-1.0",
      },
      {
        name: "CS 1.1",
        description: "Object Oriented Programming",
        instructor: "Joi, Jess",
        link: "/courses/CS-1.1",
      },
      {
        name: "CS 1.2",
        description: "Introduction to Data Structures",
        instructor: "Jess, Joi, Alan",
        link: "/courses/CS-1.2",
      },
      {
        name: "CS 1.3",
        description: "Core Data Structures and Algorithms",
        instructor: "Alan, Jess, Joi",
        link: "/courses/CS-1.3",
      },
      {
        name: "CS 2.1",
        description: "Advanced Trees & Sorting Algorithms",
        instructor: "Alan, Jess",
        link: "/courses/CS-2.1",
      },
      {
        name: "CS 2.2",
        description: "Advanced Recursion & Graphs",
        instructor: "Anne, Meredith",
        link: "/courses/CS-2.2",
      },
    ],
  },
  {
    name: "Software Product Development",
    description:
      "Understanding the software development process and foundational skills of successful engineers. Everything from building a startup to working on engineering teams, personal and professional development, AGILE, SCRUM, marketing and other software development skills.",
    courses: [
      {
        name: "SPD 1.1",
        description: "Introduction to Software Development",
        instructor: "Dan, Braus, Mitchell",
        link: "/courses/SPD-1.1",
      },
      {
        name: "SPD 1.2",
        description: "Agile Product Development & UI/UX",
        instructor: "Dan, Adriana, Mitchell",
        link: "/courses/SPD-1.2",
      },
      {
        name: "SPD 1.3",
        description: "Team Software Project",
        instructor: "Dan, Braus",
        link: "/courses/SPD-1.3",
      },
      {
        name: "SPD 1.41",
        description: "Engineering Careers 1: Communication & Interviewing",
        instructor: "Meredith, Braus",
        link: "/courses/SPD-1.41",
      },
      {
        name: "SPD 1.5",
        description: "Engineering Careers 2: Management and Leadership",
        instructor: "Jay, Dan, Dani",
        link: "/courses/SPD-1.5",
      },
      {
        name: "SPD 2.1",
        description: "Industry Collaboration Project Part 1: Client Work",
        instructor: "Dan",
        link: "/courses/SPD-2.1",
      },
      {
        name: "SPD 2.2",
        description: "Industry Collaboration Project Part 2: Analytics & Growth",
        instructor: "Dan, Dani",
        link: "/courses/SPD-2.2",
      },
      {
        name: "SPD 2.31",
        description: "Testing and Architecture",
        instructor: "Kami",
        link: "/courses/SPD-2.31",
      },
      {
        name: "SPD 2.41",
        description: "Onboarding into Companies",
        instructor: "Kami, Jay",
        link: "/courses/SPD-2.41",
      },
    ],
  },
  {
    name: "Miscellaneous",
    description: "",
    courses: [
      {
        name: "QL 1.1",
        description: "Quantitative Reasoning",
        instructor: "Kami",
        link: "/courses/QL-1.1",
      },
      {
        name: "ENT 2.1",
        description: "Entrepreneurship",
        instructor: "Braus, Anne",
        link: "/courses/ENT-2.1",
      },
    ],
  },
]

export default concentrations
