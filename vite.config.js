import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';

export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
        }),
        vue({
            template: {
                transformAssetUrls: {
                    base: null,
                    includeAbsolute: false,
                },
            },
        }),
    ],
    build: {
        outDir: 'public/build',
        assetsDir: '',
        manifest: true,
        chunkSizeWarningLimit: 1600,
        rollupOptions: {
            output: {
                manualChunks: {
                    vendor: ['vue', 'chart.js', 'jspdf', 'html2canvas']
                },
                assetFileNames: (assetInfo) => {
                    return `assets/[name]-[hash][extname]`
                },
                chunkFileNames: 'assets/[name]-[hash].js',
                entryFileNames: 'assets/[name]-[hash].js'
            }
        }
    }
});
