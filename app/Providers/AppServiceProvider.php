<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\URL;
use Illuminate\Foundation\Vite;
use Illuminate\Support\Facades\File;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if ($this->app->environment('production')) {
            URL::forceScheme('https');
            
            // Handle Vite manifest in production
            $this->app->singleton(Vite::class, function () {
                // Create a custom Vite instance that handles CSS bundled with JS
                // We only specify the JS entry point since CSS is imported through it
                return new class(['resources/js/app.js'], 'build', public_path()) extends Vite {
                    public function __invoke($entrypoints = null, $buildDirectory = null)
                    {
                        // In Vite's output, CSS is bundled with JS rather than as a separate entry
                        // So we need to filter out CSS entrypoints when they're requested directly
                        if (is_array($entrypoints) && in_array('resources/css/app.css', $entrypoints)) {
                            // Remove CSS from entrypoints since it's bundled with JS
                            $entrypoints = array_filter($entrypoints, function($entry) {
                                return $entry !== 'resources/css/app.css';
                            });
                        }
                        
                        try {
                            return parent::__invoke($entrypoints, $buildDirectory);
                        } catch (\Exception $e) {
                            // Log the error but don't crash the application
                            error_log('Vite error: ' . $e->getMessage());
                            
                            // Get the actual file names from the manifest
                            $manifest = $this->manifest();
                            
                            // Use fallback values if the manifest doesn't have the expected structure
                            $jsFile = $manifest['resources/js/app.js']['file'] ?? 'assets/app-gQopzp4V.js';
                            
                            // In Vite's output, CSS files are listed in the 'css' array of the JS entry
                            $cssFile = $manifest['resources/js/app.js']['css'][0] ?? 'assets/app-Db_qVRs7.css';
                            
                            // This ensures the correct assets are loaded even if the manifest structure is unexpected
                            return '<script type="module" src="' . asset("build/{$jsFile}") . '"></script>' .
                                   '<link rel="stylesheet" href="' . asset("build/{$cssFile}") . '">';
                        }
                    }
                };
            });
        }
    }
}
