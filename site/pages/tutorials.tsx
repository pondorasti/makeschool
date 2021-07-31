import Image from "next/image"
import gallery from "../public/mediabook/gallery.json"

export default function Gallery(): JSX.Element {
  return (
    <main>
      <div className="text-center my-20">
        <h1 className="text-4xl tracking-tight font-bold sm:text-5xl md:text-6xl">
          <span className="block">Hello again,</span>
          <span className="block text-blue-900 dark:text-blue-400">Tutorials</span>
        </h1>
      </div>
      <div className="mt-12 max-w-lg md:max-w-xl mx-auto grid gap-8 lg:grid-cols-3 lg:max-w-none">
        {gallery.map(({ title, teaser_text, cover, slug, first_page }: ITutorial) => (
          <a
            key={slug}
            className="bg-white dark:bg-gray-800 border border-gray-200 shadow-lg hover:shadow-2xl no-underline card flex flex-col overflow-hidden transform transition duration-300 ease-out rounded-lg hover:scale-[1.03]"
            href={`.${slug}${first_page}`}
          >
            <div className="flex-shrink-0 h-48 overflow-hidden">
              <Image
                src={`${slug}${cover}`.substring(1)}
                alt={title}
                width={192}
                height={192}
                objectFit="cover"
                layout="responsive"
              />
            </div>
            <div className="block p-6">
              <p className="text-gray-900 mb-0 text-xl font-semibold no-underline">{title}</p>
              <p className="text-gray-400 mb-0 mt-3 text-base">{teaser_text}</p>
            </div>
          </a>
        ))}
      </div>
    </main>
  )
}
