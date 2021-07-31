import Link from "next/link"
import dynamic from "next/dynamic"
import { useState, useEffect } from "react"
import { useTheme } from "next-themes"
import { DarkModeSwitch } from "react-toggle-dark-mode"
import classNames from "@utils/classNames"
import useWindowDimensions from "@utils/hooks/useWindowDimensions"

const iconSize = "w-5 h-5"

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
  const { width } = useWindowDimensions()

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
      <div className="flex items-center justify-between py-5 border-b border-opacity-75 border-gray-200 h-navbar">
        <Link href="/">
          {/* eslint-disable-next-line jsx-a11y/anchor-is-valid */}
          <a className="text-gray-900 text-md font-normal flex items-center">
            {width && width < 640 ? "MS" : "Make School Archives"}
          </a>
        </Link>

        <div className="flex items-center space-x-3">
          <Link href="/courses">
            {/* eslint-disable-next-line jsx-a11y/anchor-is-valid */}
            <a className="navbar-link">Courses</a>
          </Link>
          <Link href="/tutorials">
            {/* eslint-disable-next-line jsx-a11y/anchor-is-valid */}
            <a className="navbar-link">Tutorials</a>
          </Link>
          <DynamicDarkModeSwitch
            className={classNames("navbar-link", iconSize)}
            checked={resolvedTheme === "dark"}
            onChange={handleDarkModeSwitch}
          />
          <a className="navbar-link" target="_blank" rel="noopener noreferrer" href="https://discord.gg/9fF5Zer4">
            <span className="sr-only">Discord server</span>
            <svg viewBox="0 0 71 55" className={iconSize} fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <g>
                <path d="M60.1045 4.8978C55.5792 2.8214 50.7265 1.2916 45.6527 0.41542C45.5603 0.39851 45.468 0.440769 45.4204 0.525289C44.7963 1.6353 44.105 3.0834 43.6209 4.2216C38.1637 3.4046 32.7345 3.4046 27.3892 4.2216C26.905 3.0581 26.1886 1.6353 25.5617 0.525289C25.5141 0.443589 25.4218 0.40133 25.3294 0.41542C20.2584 1.2888 15.4057 2.8186 10.8776 4.8978C10.8384 4.9147 10.8048 4.9429 10.7825 4.9795C1.57795 18.7309 -0.943561 32.1443 0.293408 45.3914C0.299005 45.4562 0.335386 45.5182 0.385761 45.5576C6.45866 50.0174 12.3413 52.7249 18.1147 54.5195C18.2071 54.5477 18.305 54.5139 18.3638 54.4378C19.7295 52.5728 20.9469 50.6063 21.9907 48.5383C22.0523 48.4172 21.9935 48.2735 21.8676 48.2256C19.9366 47.4931 18.0979 46.6 16.3292 45.5858C16.1893 45.5041 16.1781 45.304 16.3068 45.2082C16.679 44.9293 17.0513 44.6391 17.4067 44.3461C17.471 44.2926 17.5606 44.2813 17.6362 44.3151C29.2558 49.6202 41.8354 49.6202 53.3179 44.3151C53.3935 44.2785 53.4831 44.2898 53.5502 44.3433C53.9057 44.6363 54.2779 44.9293 54.6529 45.2082C54.7816 45.304 54.7732 45.5041 54.6333 45.5858C52.8646 46.6197 51.0259 47.4931 49.0921 48.2228C48.9662 48.2707 48.9102 48.4172 48.9718 48.5383C50.038 50.6034 51.2554 52.5699 52.5959 54.435C52.6519 54.5139 52.7526 54.5477 52.845 54.5195C58.6464 52.7249 64.529 50.0174 70.6019 45.5576C70.6551 45.5182 70.6887 45.459 70.6943 45.3942C72.1747 30.0791 68.2147 16.7757 60.1968 4.9823C60.1772 4.9429 60.1437 4.9147 60.1045 4.8978ZM23.7259 37.3253C20.2276 37.3253 17.3451 34.1136 17.3451 30.1693C17.3451 26.225 20.1717 23.0133 23.7259 23.0133C27.308 23.0133 30.1626 26.2532 30.1066 30.1693C30.1066 34.1136 27.28 37.3253 23.7259 37.3253ZM47.3178 37.3253C43.8196 37.3253 40.9371 34.1136 40.9371 30.1693C40.9371 26.225 43.7636 23.0133 47.3178 23.0133C50.9 23.0133 53.7545 26.2532 53.6986 30.1693C53.6986 34.1136 50.9 37.3253 47.3178 37.3253Z" />
              </g>
            </svg>
          </a>
          <a
            className="navbar-link"
            target="_blank"
            rel="noopener noreferrer"
            href="https://github.com/Pondorasti/makeschool"
          >
            <span className="sr-only">GitHub repository</span>
            <svg viewBox="0 0 16 16" fill="currentColor" className={iconSize}>
              <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0016 8c0-4.42-3.58-8-8-8z" />
            </svg>
          </a>
        </div>
      </div>
    </header>
  )
}
