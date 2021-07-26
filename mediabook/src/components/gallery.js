import React from "react"
import useBaseUrl from "@docusaurus/useBaseUrl"
import gallery from "../../tutorials/gallery.json"
import useThemeContext from "@theme/hooks/useThemeContext"

export default function Gallery() {
  const { isDarkTheme } = useThemeContext()
  const cardStyling =
    "no-underline flex flex-col overflow-hidden transform transition duration-300 ease-out rounded-lg hover:scale-[1.03]"
  const headerStyling = "mb-0 text-xl font-semibold no-underline"
  const descriptionStyling = "mb-0 mt-3 text-base"
  return (
    <main className={isDarkTheme ? "bg-gray-900 html-body" : "bg-gray-50 html-body"}>
      {/* fix this */}
      <div className="px-body">
        <div className="text-center my-20">
          <h1 className={"text-4xl tracking-tight font-bold sm:text-5xl md:text-6xl"}>
            <span className={isDarkTheme ? "text-white-50 block" : "text-gray-900 block"}>Hello again,</span>
            <span className={isDarkTheme ? "text-blue-400 block" : "text-blue-700 block"}>Tutorials</span>
          </h1>
        </div>
        <div className="mt-12 max-w-lg md:max-w-xl mx-auto grid gap-8 lg:grid-cols-3 lg:max-w-none">
          {gallery.map(({ title, teaser_text, cover, slug, first_page }) => (
            <a
              key={slug}
              className={
                isDarkTheme ? `bg-gray-800 ${cardStyling}` : `bg-gray-50 shadow-lg hover:shadow-2xl ${cardStyling}`
              }
              href={"." + slug + first_page}
            >
              <div className="flex-shrink-0">
                <img className="h-48 w-full object-cover" src={useBaseUrl(slug + cover)} alt={title} />
              </div>
              <div className="block p-6">
                <p className={isDarkTheme ? `text-gray-50 ${headerStyling}` : `text-gray-900 ${headerStyling}`}>
                  {title}
                </p>
                <p
                  className={
                    isDarkTheme ? `text-gray-400 ${descriptionStyling}` : `text-gray-400 ${descriptionStyling}`
                  }
                >
                  {teaser_text}
                </p>
              </div>
            </a>
          ))}
        </div>
      </div>
    </main>
  )
}
