interface IHero {
  title?: string
  titleCta: string
  description?: JSX.Element
}

export default function Hero({ title, titleCta, description }: IHero): JSX.Element {
  return (
    <div className="text-center my-20">
      <h1 className="text-4xl tracking-tight font-bold text-gray-900 sm:text-5xl md:text-6xl">
        <span className="block">{title}</span>
        <span className="block text-blue-900 dark:text-blue-400">{titleCta}</span>
      </h1>
      {description && (
        <p className="mt-14 mx-auto text-base text-gray-400 sm:text-xl lg:text-lg xl:text-xl max-w-2xl">
          {description}
        </p>
      )}
    </div>
  )
}

Hero.defaultProps = {
  title: "Hello again,",
  description: null,
}
