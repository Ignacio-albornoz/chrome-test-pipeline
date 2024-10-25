// test.js
const puppeteer = require('puppeteer');

(async () => {
    const browser = await puppeteer.launch({ headless: true });
    const page = await browser.newPage();
    await page.goto('https://example.com');
    console.log('Página cargada:', await page.title());
    await browser.close();
})();