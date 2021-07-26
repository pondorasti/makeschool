import { useEffect } from "react"
import { AppProps } from "next/app"
import { useRouter } from "next/router"
import "tailwindcss/tailwind.css"
import { ThemeProvider } from "next-themes"
import NavigationBar from "@components/NavigationBar"
import Footer from "@components/Footer"
import * as Fathom from "fathom-client"

function MyApp({ Component, pageProps }: AppProps): JSX.Element {
  // Fathom
  // Source: https://vercel.com/guides/deploying-nextjs-using-fathom-analytics-with-vercel
  const router = useRouter()
  useEffect(() => {
    const siteId = process.env.NEXT_PUBLIC_FATHOM
    if (!siteId) {
      return () => {}
    }

    Fathom.load(siteId, {
      includedDomains: ["makeschool.fail"],
    })

    function onRouteChangeComplete() {
      Fathom.trackPageview()
    }
    // Record a pageview when route changes
    router.events.on("routeChangeComplete", onRouteChangeComplete)

    return () => {
      router.events.off("routeChangeComplete", onRouteChangeComplete)
    }
  }, [])

  return (
    <ThemeProvider attribute="class" storageKey="ms-theme" defaultTheme="system">
      <NavigationBar />
      <div className="px-body">
        {/* eslint-disable-next-line react/jsx-props-no-spreading */}
        <Component {...pageProps} />
      </div>
      <Footer />
    </ThemeProvider>
  )
}
export default MyApp
