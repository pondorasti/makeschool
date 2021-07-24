import Head from "next/head"
import Concentrations from "@components/Concentrations"

export default function Home(): JSX.Element {
  return (
    <div>
      <Head>
        <title>Make School</title>
        <meta name="description" content="An archive of anything Make School related, Courses, Labs..." />
      </Head>

      <main>
        <div className="text-center my-20">
          <h1 className="text-4xl tracking-tight font-bold text-gray-900 sm:text-5xl md:text-6xl">
            <span className="block">Hello again,</span>
            <span className="block text-blue-900 dark:text-blue-400">Make School</span>
          </h1>
        </div>

        <Concentrations />
      </main>
    </div>
  )
}
