import React from "react"
import Layout from "@theme/Layout"
import Link from "@docusaurus/Link"
import useBaseUrl from "@docusaurus/useBaseUrl"
import gallery from "../../tutorials/gallery.json"

export default function Home() {
  return (
    <Layout description="A collection of tech related tutorials.">
      <main className="mx-auto">
        <div className="text-center my-20">
          <h1 className="text-4xl tracking-tight font-bold text-gray-900 sm:text-5xl md:text-6xl">
            <span className="block">Hello again,</span>
            <span className="block text-blue-900 dark:text-blue-400">Tutorials</span>
          </h1>
        </div>

        <div className="flex flex-col">
          {gallery.map(({ title, teaser_text, cover, slug, first_page }) => (
            <Link key={slug} className="mb-8 sm:flex" to={"." + slug + first_page}>
              <div className="mb-4 flex-shrink-0 sm:mb-0 sm:mr-4 border-8 border-gray-200">
                <img
                  className="object-cover rounded-lg h-48 w-full sm:w-48"
                  src={useBaseUrl(slug + cover)}
                  alt={title}
                />
              </div>
              <div>
                <h4 className="text-lg font-bold">{title}</h4>
                <p className="mt-1">{teaser_text}</p>
              </div>
            </Link>
          ))}
        </div>
      </main>
    </Layout>
  )
}

{
  /* <article key={slug}>
  <img src={useBaseUrl(slug + cover)} alt={title} />
  <Link className="button button--primary" to={"." + slug + first_page}>
    {slug}
  </Link>
</article> */
}
