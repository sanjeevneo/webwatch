# Simple Web Watch

## Description

Web Watch is a simple shell script that allows you to monitor changes in webpages. It can notify you when a webpage changes, and optionally, it can watch only part of the page, specified by an XPath query. It works very nicely with cron for scheduling checks at regular intervals.

## Usage

Each time the script runs, it shows a diff between the content the last time it ran and the current content.

Here are some examples of how to use the script with cron:

```bash
# Check for weather updates
30 6 * * * web-watch https://www.weather.com/weather/today/l/USNY0996:1:US '//div[contains(@class, "CurrentConditions--phraseValue--2xXSr")]/text()' # Weather update for New York

# Monitor product availability
45 7 * * * web-watch https://www.apple.com/shop/buy-iphone/iphone-13 '//*[contains(@class,"as-purchaseinfo-dudeinfo-deliverymsg")]/text()' # iPhone 13 availability

# New blog post available?
35 8 * * 1 web-watch https://blog.openai.com/ '//div[@class="post-title"]/a/text()'
25 9 * * * web-watch https://ai.googleblog.com/ '//h2[@class="post-title entry-title"]/a/text()'
40 10 * * * web-watch https://deepmind.com/blog '//*[@class="BlogItem__Title-sc-1kxdv0h-2 gUeRZI"]/text()'

# Monitor forum threads
35 11 * * * web-watch https://forums.developer.apple.com '//*[contains(@class, "jive-thread-topic-title")]/a/text()'
35 12 * * * web-watch https://stackoverflow.com/questions/tagged/python '//*[@class="question-hyperlink"]/text()'

# New software versions available?
50 13 * * 0 web-watch https://www.python.org/downloads/ '//*[@id = "content"]//ol//li//span//a/text()'
30 14 * * * web-watch https://nodejs.org/en/download/ '//a[contains(@href,"download") and contains(text(),"Current")]/text()'
20 15 * * * web-watch https://www.ruby-lang.org/en/downloads/ '//td[contains(@class, "t-version")]/text()'
45 16 * * * web-watch https://golang.org/dl/ '//*[@class="downloadBox"]/a[1]/text()'
35 17 * * * web-watch https://www.java.com/en/download/ '//*[@id="java-version"]/text()'
40 18 * * * web-watch https://www.php.net/downloads.php '//*[@id="layout-content"]/section[1]/div/ul/li[1]/a/text()'
```

## Dependencies

* `curl`: Used to fetch the webpage content.
* `xmllint`: Used to process the webpage content with XPath queries.

## Installation

1. Clone this repository or download the script.
2. Make the script executable with chmod +x web-watch.
3. Move the script to a location in your PATH, for example, /usr/local/bin.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License.
