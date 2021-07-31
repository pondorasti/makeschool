import Head from "next/head"
import Concentrations from "@components/Concentrations"
import Hero from "@components/Hero"

export default function Home(): JSX.Element {
  return (
    <div>
      <Head>
        <title>Make School</title>
        <meta name="description" content="An archive of anything Make School related, Courses, Labs..." />
      </Head>

      <main>
        <Hero ctaText="Make School" />
        <Concentrations />
      </main>
    </div>
  )
}
