// src/app.spec.ts
import { test, expect } from '@playwright/test';

test('Vite + React app test', async ({ page }) => {
    // Navigate to the local development server.
    await page.goto('http://localhost:4173/');

    // Check if the Vite logo is visible.
    await expect(page.locator('img[alt="Vite logo"]')).toBeVisible();

    // Check if the React logo is visible.
    await expect(page.locator('img[alt="React logo"]')).toBeVisible();

    // Check if the title is "Vite + React".
    await expect(page.locator('h1')).toHaveText('Vite + React');

    // Check if the counter button increments the count.
    const counter = page.locator('button');
    await expect(counter).toContainText('count is 0');
    await counter.click();
    await expect(counter).toContainText('count is 1');

    // Check if HMR text is present.
    // Use a more specific locator to select the correct paragraph
    await expect(page.locator('p:has-text("Edit src/App.tsx and save to test HMR")')).toHaveText(/Edit src\/App.tsx and save to test HMR/);

    // Optionally, take a screenshot of the page.
    await page.screenshot({ path: 'screenshot.png' });
});
