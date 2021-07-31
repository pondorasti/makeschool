import Head from "next/head"
import Concentrations from "@components/Concentrations"
import Hero from "@components/Hero"

export default function Home(): JSX.Element {
  return (
    <main>
      <Head>
        <title>Make School</title>
        <meta name="description" content="A collection of restored tutorials." />
      </Head>

      <Hero ctaText="Concentrations" />
      <Concentrations />
    </main>
  )
}
