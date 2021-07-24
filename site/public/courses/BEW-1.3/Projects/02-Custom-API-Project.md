# Custom Authenticated API Project

It's time to get creative and write the authenticated API of your dreams!

## Objectives

1. Practice the SDLC by **completing a project from proposal to deployment** with a **focus on Test Driven Development** practices.
1. **Utilize all the techniques learned** in class **in a single cohesive project**.
1. Produce a **portfolio-worthy authenticated API** to show off to the world!

## Requirements

### Functional Requirements

1. Project contains a **simple, static single page brochure site** that explains what the API does and a link to the API's documentation.
1. Project **contains documentation** explaining how to use your API.
1. The ability to **CREATE**, **READ**, **UPDATE**, and **DELETE** the object(s) in your API.
1. At least **one of each** endpoint: `GET`, `POST`, `PUT`, and `DELETE`.
1. A **database persistence layer** (e.g. MongoDB)

### Non-Functional Requirements

1. The API must be written using the **appropriate application of RESTful techniques**.
1. The API implementation must **follow the MVC pattern**.
1. The API must be hosted in a **public GitHub repository**.
1. The project repository **should not expose any secrets**!
1. The API must have a discernible theme or **serve a distinct purpose**. See the [Examples](#Example-APIs) for well-themed and purposed APIs.
1. The final project must be **deployed and fully accessible** via the internet and **callable via any consumer**.
1. The final project must be **fully documented**.
1. Must **develop the API using a TDD approach** as discussed in class on [Day 9](Lessons/Lesson09.md).
1. The syntax in the final project deliverable will **adhere to [Airbnb JavaScript Style Guide](https://github.com/airbnb/javascript)**. You can use the [eslint-config-airbnb-base](https://www.npmjs.com/package/eslint-config-airbnb-base) package to lint your syntax.

### Level Up - API + Skills (_Optional_)

**NOTE**: `++` indicates the ability to level up the preceding skill through the following stretch challenges:

1. **`Security++`**: Add the ability to **securely provision an API user** using the authorization and authentication techniques learned in class. **Unauthenticated users should not be able to use the API!**
1. **`Code++`**: Love integrations? Find a clever way to **utilize a third-party API _within_ your API**!
1. **`DevOps++`**: Deploy API and brochure site over **HTTPS**.
1. **`Networking++`**: Write and **post a short blog** on Medium, Hacker News, or dev.to debuting and promoting your life-changing new API! Sign up now!

## Example APIs

* [List of Public APIs](https://github.com/toddmotto/public-apis) - Giant list of public APIs!
* [API List](https://apilist.fun/) - List of "fun" APIs to inspire you!

## Implementation Notes

### `dotenv` - Keeping Secrets Safe

* Look into the [dotenv](https://www.npmjs.com/package/dotenv) package on NPM. This package will allow you to store secrets in a `.env` file that you deliberately add to the project's `.gitignore` file. Be sure to **read the documentation** fully!

### Heroku Deployment

* Make sure the `Access-Control-Allow-Origin` header is set to `*` so that requests to your API can be made from any domain!

### Phases and Deadlines

1. **Phase 1**: Proposal
    * **Deliverables**:
        * Public GitHub Repository Link
        * `README.md` in the repo with proposal.
1. **Phase 2**: Test First Approach - **Due Day 10 @ 11:59pm**.
    * **Deliverables**:
        * `/tests/` folder in repo containing TDD code and strategy.
        * `/models/` folder in repo containing models code.
        * `/controllers/` folder in repo containing route code as described by the documentation site.
        * **NOTE**: Phase 2 does not need to include authentication.
    * **Code Review 1**: Students will peer review each other's code during class.
1. **Phase 3**: Final Deliverable - **Due Day 14 @ 11:59pm**.
    * **Deliverables**:
        * Link to deployed API brochure site.
        * Link to code repository.
        * Link to deployed API Heroku site.
    * **Code Review 2**: Students receive after class.

## Getting Started

Fork the provided [**auth-api-starterpack**](https://github.com/droxey/auth-api-starterpack) repository and examine the contents to reveal the next steps! We will update the dependencies together in class.

## Additional Resources

* [Grading Rubric](Rubrics/02-Custom-API-Project.md)
