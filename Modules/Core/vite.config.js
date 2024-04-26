import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    build: {
        outDir: '../../public/build-core',
        emptyOutDir: true,
        manifest: true,
    },
    plugins: [
        laravel({
            publicDirectory: '../../public',
            buildDirectory: 'build-core',
            input: [
                __dirname + '/resources/assets/sass/app.scss',
                __dirname + '/resources/assets/js/app.js',
                __dirname + '/resources/css/filament/theme.css',
            ],
            refresh: true,
        }),
    ],
});

//export const paths = [
//    'Modules/Core/resources/assets/sass/app.scss',
//    'Modules/Core/resources/assets/js/app.js',
//];