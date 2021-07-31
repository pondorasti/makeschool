import Head from "next/head"
import Hero from "@components/Hero"

export default function Home(): JSX.Element {
  return (
    <main className="h-[75vh]">
      <Head>
        <title>Make School</title>
        <meta name="description" content="An archive of anything Make School related, Courses, Labs..." />
      </Head>

      <Hero ctaText="Make School" />
    </main>
  )
}
