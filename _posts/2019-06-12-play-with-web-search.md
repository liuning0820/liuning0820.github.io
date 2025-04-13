---
layout: post
title: "Play With Web Search"
author: liuning0820
comments: true
---

## Search Engine 搜索引擎

- [Google](http://www.google.com/ncr)
- Bing
- [startpage](http://www.startpage.com) ( highlights: privacy）
- YouTube
- DuckDuckGo
- Baidu

## Research Process

- Clarify your research objectives and your research goals.
- Start broadly and narrow it down.
- Identify resources.
- Keep track of what you do.
- Plan to learn things along the way.
- Know when to stop the research.

## Google Search

### [How Google Search Engine Works](https://www.google.com/search/howsearchworks/)

The three key processes in delivering search results to you are:

- Crawling: Does Google know about your site? Can we find it?
- Indexing: Can Google index your site?
- Serving: Does the site have good and useful content that is relevant to the user's search? **PageRank**.

### Query - The art of keyword choices

- Every word matters
- Word order matters
- Capitalization does not matter
- Punctuation **often** does not matter ($, #, and + sometimes matter, for example, C vs C++)

Tips: Practice to find some word in a web page using CTRL+F to prove your thinking that it will appear or not.

- Use 'define xxx' to identify the meaning of words

### Filter

- Filter image results by color
- Filter query result using operators
  - Find content within domain:

    > ```sh
    > tesla site:stanford.edu
    > ```

  - Find specific file type:

    > ```sh
    > filetype:kml 北京奥运会场馆
    > ```
    Download that file, and upload to [google my maps](https://www.google.com/mymaps) to view.

- Use the minus sign (-) to eliminate irrelevant results.
  - There must be a space before the minus sign.
  - There must not be a space between the minus sign and the word you want to eliminate.

- Use quotes to search for a exact phrase.

### Verify Result

Credibility - can you trust the information you find online? How can you find out whether information is accurate and true?
Page Ranking can only make sure the result relevant to your query, but can't make sure the ordered result is credible for you.

- To check the credibility, just do one more search.

Variant data

- Don't imply the answer in your query when you do the search
- The result may differ when query in different time range. (ex, when you query how many countries in the world)
- The result may differ when query in different measure. (ex. circumference of the earth by circumpolar or equatorial)
- To verify the **source** of a piece of information, use the precise information you have.
- To confirm a **fact**, use a generic description for what you seek.

### Google Specific Search Feature

- Conversions: From Units to Units --- pattern to follow: [number units in units]. For example, "100 usd in Chinese Yuan"
- weather somewhere
- time somewhere

## Using WHOIS to identify who owns the site

If you see a second company listed as a contact on the WHOIS page, then a relationship exists between the two companies.
For example, run the command below you will find youku.com has relationship with Alibaba.

```sh
whois youku.com

```

## Reference

[Open Course：Power Searching](https://coursebuilder.withgoogle.com/)

[A Google A Day](http://www.agoogleaday.com/)
