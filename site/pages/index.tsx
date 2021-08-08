import Head from "next/head"
import Hero from "@components/Hero"

export default function Home(): JSX.Element {
  return (
    <main className="h-[75vh]">
      <Head>
        <title>Make School</title>
        <meta name="description" content="An archive of anything Make School related, Courses, Labs..." />
      </Head>

      <Hero
        titleCta="Make School"
        description={
          <>
            Founded in 2012, Make School evolved into a private university in San Francisco, California, offering a
            2-Year Accelerated Bachelor&apos; s Degree in Applied Computer Science. With a program built by industry
            partners like Google, Yelp, Microsoft, Bloomberg and taught by real engineers.
            <br /> <br />
            This website is a conservatory for everything Make School related before it officially closed on July 30th,
            2021, and all content was erased from the internet.
          </>
        }
      />
    </main>
  )
}
