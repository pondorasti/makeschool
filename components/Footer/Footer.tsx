export default function Footer(): JSX.Element {
  return (
    <footer>
      <div className="max-w-7xl mx-auto py-12 px-4 sm:px-6 md:flex md:items-center md:justify-between lg:px-8">
        <div className="flex justify-center space-x-6 md:order-2">
          <div className="px-5 py-2">
            <a href="/badges" className="text-base text-gray-400 hover:text-gray-600">
              Badges
            </a>
          </div>
        </div>
        <div className="mt-8 md:mt-0 md:order-1">
          <p className="text-center text-base text-gray-400">&copy; 2021 Alexandru Turcanu, All rights reserved.</p>
        </div>
      </div>
    </footer>
  )
}
