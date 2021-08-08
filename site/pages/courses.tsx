import Concentrations from "@components/Concentrations"
import Hero from "@components/Hero"

export default function Home(): JSX.Element {
  return (
    <main>
      <Hero titleCta="Courses" />
      <Concentrations />
    </main>
  )
}
