# Summary
> pending

# Objective

Its objective is to create a graph from any network to give the people the graphical information to know the people or entities are around their profiles.
# Introduction
Few years ago I was searching for a way to generate a graph of my friends in facebook, most because I didn't know how to talk without overthinking in that moment. So I started searching for a tool that give that kind of graph. I found a video titled [[Gephi Tutorial - Visualizing Facebook Network]]. There the dude explains how to use [[netvizz]] and [[Gephi]] to [[generate a vizualization of your facebook friends]] and [[highlight the comunities]]. It work at the moment but it has its flaws. For example: the final export does not conbinced me because it was a little bit meassy with my friends-net. So i decided to generate my own data set to pass it to Gephi. And so I do, and this was the result:
![[fb-friends-crawler svg]]

- OSSI is a project based on the idea of https://github.com/ricexen/OSSI
- OSSI means Open Source Social information
- its a [[OSINT]] tool

first I tried the [[Scrapy]] library but the limitant was to login into facebook. Then I tried the library [[playwright]] but I cannot handle an element to get the picture using the locator method. My las chance is with [[Selenium]] but I donn't wanna try another tool that runs a browser within the api to crawl. Trying again with [[Scrapy]] I give up with that framework to login into facebook. So I get back using [[playwright]] to get access to the account and it works! finally works! (2022-06-29) this is the code:
```python
with sync_playwright() as playwright_api:
	browser = playwright_api.chromium.launch_persistent_context(
		'browser', headless=False
	)
	page = browser.new_page()
	page.goto(self.login_page, wait_until='networkidle')
	if 'login' in page.url:
		form = page.locator('//*/form').first
		container = form.locator('//div')
		email_input = container.locator("//*/input[@id='email']").first
		passwd_input = container.locator("//*/input[@id='pass']").first
		login_button = form.locator(
			'//*/*[@id="loginbutton"]'
		).first
		email_input.fill(credentials.user)
		passwd_input.fill(credentials.passwd)
		login_button.click()
		print('once you are in your feed press [ENTER]')
		wait()
	cookies = browser.cookies(urls=['https://www.facebook.com'])
```
in the journey I learn that [[scrapy carries the responsability of csrf token for you]] I studied the [[scrapy architecture]] to know if something there gives me a clue to know how to deal with the login to facebook.
Then when I realize that with [[playwright]] I can get the cookies, it gives me a fresh air about how to deal with the problem

# Libraries
for this project all the libraries are in the requirements.txt file, but most of them were from the video [[Network of The Witcher - Relationship Extraction & Network Analysis with Spacy & NetworkX]]
Also its going to use [[Scrapy]] para extraer los datos de las redes sociales

# Architecture
For the architecture of this project its using [[Factory Method]], [[Iterator pattern]], [[Strategy pattern]]