---
title: scrapy data flow
tags:
- ✨extract
---


<table>
<tr>
<td> type </td>
<td> #✨extract </td>
</tr>
<tr>
<td> position </td>
<td> <a href="https://docs.scrapy.org/en/latest/topics/architecture.html#data-flow">https://docs.scrapy.org/en/latest/topics/architecture.html#data-flow</a> </td>
</tr>
<tr>
<td> author </td>
<td> [[Scrapy developers]] </td>
</tr>
</table>


---

# scrapy data flow
The data flow in Scrapy is controlled by the execution engine, and goes like this:

1.  The [Engine](https://docs.scrapy.org/en/latest/topics/architecture.html#component-engine) gets the initial Requests to crawl from the [Spider](https://docs.scrapy.org/en/latest/topics/architecture.html#component-spiders).
2.  The [Engine](https://docs.scrapy.org/en/latest/topics/architecture.html#component-engine) schedules the Requests in the [Scheduler](https://docs.scrapy.org/en/latest/topics/architecture.html#component-scheduler) and asks for the next Requests to crawl.    
3.  The [Scheduler](https://docs.scrapy.org/en/latest/topics/architecture.html#component-scheduler) returns the next Requests to the [Engine](https://docs.scrapy.org/en/latest/topics/architecture.html#component-engine).    
4.  The [Engine](https://docs.scrapy.org/en/latest/topics/architecture.html#component-engine) sends the Requests to the [Downloader](https://docs.scrapy.org/en/latest/topics/architecture.html#component-downloader), passing through the [Downloader Middlewares](https://docs.scrapy.org/en/latest/topics/architecture.html#component-downloader-middleware) (see [`process_request()`](https://docs.scrapy.org/en/latest/topics/downloader-middleware.html#scrapy.downloadermiddlewares.DownloaderMiddleware.process_request "scrapy.downloadermiddlewares.DownloaderMiddleware.process_request")).    
5.  Once the page finishes downloading the [Downloader](https://docs.scrapy.org/en/latest/topics/architecture.html#component-downloader) generates a Response (with that page) and sends it to the Engine, passing through the [Downloader Middlewares](https://docs.scrapy.org/en/latest/topics/architecture.html#component-downloader-middleware) (see [`process_response()`](https://docs.scrapy.org/en/latest/topics/downloader-middleware.html#scrapy.downloadermiddlewares.DownloaderMiddleware.process_response "scrapy.downloadermiddlewares.DownloaderMiddleware.process_response")).    
6.  The [Engine](https://docs.scrapy.org/en/latest/topics/architecture.html#component-engine) receives the Response from the [Downloader](https://docs.scrapy.org/en/latest/topics/architecture.html#component-downloader) and sends it to the [Spider](https://docs.scrapy.org/en/latest/topics/architecture.html#component-spiders) for processing, passing through the [Spider Middleware](https://docs.scrapy.org/en/latest/topics/architecture.html#component-spider-middleware) (see [`process_spider_input()`](https://docs.scrapy.org/en/latest/topics/spider-middleware.html#scrapy.spidermiddlewares.SpiderMiddleware.process_spider_input "scrapy.spidermiddlewares.SpiderMiddleware.process_spider_input")).    
7.  The [Spider](https://docs.scrapy.org/en/latest/topics/architecture.html#component-spiders) processes the Response and returns scraped items and new Requests (to follow) to the [Engine](https://docs.scrapy.org/en/latest/topics/architecture.html#component-engine), passing through the [Spider Middleware](https://docs.scrapy.org/en/latest/topics/architecture.html#component-spider-middleware) (see [`process_spider_output()`](https://docs.scrapy.org/en/latest/topics/spider-middleware.html#scrapy.spidermiddlewares.SpiderMiddleware.process_spider_output "scrapy.spidermiddlewares.SpiderMiddleware.process_spider_output")).    
8.  The [Engine](https://docs.scrapy.org/en/latest/topics/architecture.html#component-engine) sends processed items to [Item Pipelines](https://docs.scrapy.org/en/latest/topics/architecture.html#component-pipelines), then send processed Requests to the [Scheduler](https://docs.scrapy.org/en/latest/topics/architecture.html#component-scheduler) and asks for possible next Requests to crawl.    
9.  The process repeats (from step 3) until there are no more requests from the [Scheduler](https://docs.scrapy.org/en/latest/topics/architecture.html#component-scheduler).
