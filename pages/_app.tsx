import type { AppProps } from 'next/app'
import "tailwindcss/tailwind.css"
import { ThemeProvider } from "next-themes"
import NavigationBar from "@components/NavigationBar"

function MyApp({ Component, pageProps }: AppProps) {
  return (
  <ThemeProvider attribute="class" storageKey="ms-theme" defaultTheme="system">
    <NavigationBar />
    <div className="px-body">
      <Component {...pageProps} />
    </div>
  </ThemeProvider>
  )
}
export default MyApp
