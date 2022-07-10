---
title: trying to get an image url from facebook with playwright
tags:
- ✍️annotation
---

type:: #✍️annotation
position:: 
author:: [[Christian Camacho]]

---

# trying to get an image url from facebook with playwright
when I was trying to build [🌱OSSI-V2](/🌱OSSI-V2.md) a new iteration of OSSI. I was using [playwright](/Bibliography/playwright.md) library to build a part of extrating data
```python
with sync_playwright() as p:
            browser_context = p.chromium.launch_persistent_context(
                'login/fb', headless=False)
            page = browser_context.pages[0]
            page.goto('https://www.facebook.com/login')
            sleep(1)
            if 'login' in page.url:
                page.fill('input[name="email"]', config.fb_user)
                page.fill('input[name="pass"]', config.fb_pass)
                page.click('button[name="login"]')
                print('Press [Enter] when you finish login...')
                wait()

            page.goto(url_profile)
            image = page.locator(
                '#mount_0_0_fk > div > div:nth-child(1) > div > div.rq0escxv.l9j0dhe7.du4w35lb > div > div > div.j83agx80.cbu4d94t.d6urw2fd.dp1hu0rb.l9j0dhe7.du4w35lb > div.j83agx80.cbu4d94t.dp1hu0rb > div > div > div:nth-child(1) > div.rq0escxv.l9j0dhe7.du4w35lb.j83agx80.pfnyh3mw.taijpn5t.gs1a9yip.owycx6da.btwxx1t3.ihqw7lf3.cddn0xzi > div > div > div > div.mpmpiqla.aovbcota.fln0ibad.anxc55fr.aw8vmcxp.l54s1dlg.a0ua4ts5.rmzkg9qa > div > div > div > svg > g > image'
            ).element_handle(timeout=3000)
            # image = svg.locator('> g > image')
            print(image)
            profile_image = image.get_attribute('xlink:href')
            print(f'profile image: {profile_image}')
            wait()
```
