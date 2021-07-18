# Lightweight CSS Library
This is a lightweight css library to style basic components on a web page.

## Features

### Nav Bar

The Organization expected for a nav bar is as follows.

```
  <nav class="navbar sticky">

    <ul class="nav-title">
      <li><a href="http://Some Site.com"><h1>TITLE</h1></a></li>
    </ul>
    <section class="nav-section" >
      <ul>
        <li>
          <a href="https://jaytria.com">Link One</a>
        </li>
        <li>
          <a href="https://jaytria.com">Link Two</a>
        </li>
        <li>
          <a href="https://jaytria.com">Link Three</a>
        </li>
      </ul>
    </section>

</nav>

```

The sticky class is optional if you don't want to have sticky functionality.

### Footer

This is a basic sample for how to buile a footer.
Each block with the class of `col` will center themselves in a row in the footer. Additionally a sub-footer is available for an additional area for content.

```
  <footer>
    <section class="col">
      <span class="footer-title">
        <a href="http://google.com"><h2>Title One</h2></a>
      </span>
      <ul>
        <li>
        <a href="http://google.com">Title One</a>
        </li>
        <li>
            <a href="http://google.com">Link Two</a>
        </li>      
        <li>
            <a href="http://google.com">Link Three</a>
        </li>
      </ul>
    </section>

    <section class="col">
        <span class="footer-title">
          <a href="http://jkjoogle.com"><h2>Title One</h2></a>
        </span>
        <ul>
          <li>
            <a href="http://xazabbad.com">Link One</a>
          </li>
          <li>
              <a href="http://xyzabc.com">Link Two</a>
          </li>      
          <li>
              <a href="http://google.com">Link Three</a>
          </li>
        </ul>
      </section>

      <section class="col">
          <span class="footer-title">
            <h2>Title One</h2>
          </span>
          <ul>
            <li>
              <a href="http://google.com">Link One</a>
            </li>
            <li>
                <a href="http://google.com">Link Two</a>
            </li>      
            <li>
                <a href="http://google.com">Link Three</a>
            </li>
          </ul>
        </section>
  </footer>
```

### Sub Footer

```
  <section class="sub-footer">
        <h2>Title One</h2>
        <ul>
          <li>
            <a href="http://google.com">Link One</a>
          </li>
          <li>
              <a href="http://google.com">Link Two</a>
          </li>      
          <li>
              <a href="http://google.com">Link Three</a>
          </li>
        </ul>
  </section>
```

