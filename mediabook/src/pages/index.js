import React from "react"
import clsx from "clsx"
import Layout from "@theme/Layout"
import Link from "@docusaurus/Link"
import useDocusaurusContext from "@docusaurus/useDocusaurusContext"
import styles from "./index.module.css"
import gallery from "../../tutorials/gallery.json"
import useBaseUrl from "@docusaurus/useBaseUrl"

function HomepageHeader() {
  const { siteConfig } = useDocusaurusContext()
  return (
    <header className={clsx("hero hero--primary", styles.heroBanner)}>
      <div className="container">
        <h1 className="hero__title">{siteConfig.title}</h1>
        <p className="hero__subtitle">{siteConfig.tagline}</p>
        <div className={styles.buttons}>Docusaurus Tutorial - 5min ⏱️</div>
      </div>
    </header>
  )
}

export default function Home() {
  const { siteConfig } = useDocusaurusContext()

  return (
    <Layout title={`Hello from ${siteConfig.title}`} description="Description will go into a meta tag in <head />">
      <main>
        <HomepageHeader />
        {gallery.map(({ title, teaser_text, cover, slug, first_page }) => (
          <article key={slug}>
            <h1 className="article__title">{title}</h1>
            <p className="article__description">{teaser_text}</p>
            <img src={useBaseUrl(slug + cover)} alt={title} />
            <Link className="button button--primary" to={"." + slug + first_page}>
              {slug}
            </Link>
          </article>
        ))}
      </main>
    </Layout>
  )
}
