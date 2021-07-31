interface IHero {
  text?: string
  ctaText: string
}

export default function Hero({ text, ctaText }: IHero): JSX.Element {
  return (
    <div className="text-center my-20">
      <h1 className="text-4xl tracking-tight font-bold text-gray-900 sm:text-5xl md:text-6xl">
        <span className="block">{text}</span>
        <span className="block text-blue-900 dark:text-blue-400">{ctaText}</span>
      </h1>
    </div>
  )
}

Hero.defaultProps = {
  text: "Hello again,",
}
