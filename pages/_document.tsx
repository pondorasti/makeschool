import NextDocument, { Html, Head, Main, NextScript } from "next/document"

export default class Document extends NextDocument {
  render(): JSX.Element {
    return (
      <Html lang="en" className="nightwind">
        <Head />
        <body className="max-w-7xl mx-auto bg-gray-50">
          <Main />
          <NextScript />
        </body>
      </Html>
    )
  }
}
