import Link from "next/link"
import dynamic from 'next/dynamic'
import { useState, useEffect } from "react"
import { useTheme } from "next-themes"
import { DarkModeSwitch } from "react-toggle-dark-mode"

// Source: https://github.com/vercel/next.js/issues/4515#issuecomment-810635574
const DynamicDarkModeSwitch = dynamic(
  () => {
    const promise = import("react-toggle-dark-mode").then((module) => module.DarkModeSwitch)
    return promise
  },
  { ssr: false, loading: () => <DarkModeSwitch checked={false} onChange={() => undefined} /> }
)

export default function NavigationBar(): JSX.Element {
  const [, setMounted] = useState(false)
  const { resolvedTheme, setTheme } = useTheme()

  // When mounted on client, show theme switcher
  useEffect(() => setMounted(true), [])

  function handleDarkModeSwitch() {
    if (resolvedTheme === "dark") {
      setTheme("light")
    } else if (resolvedTheme === "light") {
      setTheme("dark")
    }
  }

  return (
    <header className="sticky top-0 z-30 px-body bg-blur">
      <div
        className="flex items-center justify-between py-5 border-b border-opacity-75 border-gray-200 h-navbar bg-blur"
      >
        <Link href="/">
          {/* eslint-disable-next-line jsx-a11y/anchor-is-valid */}
          <a className="text-gray-900 text-md font-normal flex items-center">
            Make School Archives
          </a>
        </Link>

        <div className="flex items-center space-x-3">
          <DynamicDarkModeSwitch
            className="navbar-link"
            checked={resolvedTheme === "dark"}
            onChange={handleDarkModeSwitch}
            size={20}
          />
        </div>
      </div>
    </header>
  )
}
