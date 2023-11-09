// playwright.config.ts
import { PlaywrightTestConfig } from '@playwright/test';

const config: PlaywrightTestConfig = {
    testMatch: '**/*.spec.ts',
    // ... other configurations
};

export default config;
