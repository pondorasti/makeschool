import Concentrations from "@components/Concentrations"
import Hero from "@components/Hero"
import Head from "next/head"

export default function Home(): JSX.Element {
  return (
    <main>
      <Head>
        <title>Courses</title>
        <meta name="description" content="A collection of all the courses offered by Make School." />
      </Head>

      <Hero titleCta="Courses" />
      <Concentrations />
    </main>
  )
}
