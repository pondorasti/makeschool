import React from "react"
import Layout from "@theme/Layout"
import Gallery from "../components/gallery"

export default function Home() {
  return (
    <Layout description="A collection of tech related tutorials.">
      <Gallery />
    </Layout>
  )
}
