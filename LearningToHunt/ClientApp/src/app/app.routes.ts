// default
import { Routes } from '@angular/router';

// added

export const routes: Routes = [
    {
        path: '',
        loadComponent: () => import('./home/home.component').then((m) => m.HomeComponent) 
    },
    {
        path: "weather-forecast", 
        loadComponent: () => import('./weather-forecast/weather-forecast.component').then((m) => m.WeatherForecastComponent)
    },
    {
        path: "article/:articleId", 
        loadComponent: () => import('./article/article.component').then((m) => m.ArticleComponent) 
    },
    { path: "hunting-guide", redirectTo: 'article/1' },
    {
        path: "article", 
        loadComponent: () => import('./article/article.component').then((m) => m.ArticleComponent)
    },
    {
        path: "articles", 
        loadComponent: () => import('./article/article.component').then((m) => m.ArticleComponent)
    },
    {
        path: "blog/:blogId", 
        loadComponent: () => import('./blog/blog.component').then((m) => m.BlogComponent)
    },
    {
        path: "blog", 
        loadComponent: () => import('./blog/blog.component').then((m) => m.BlogComponent)
    },
    {
        path: "blogs", 
        loadComponent: () => import('./blog/blog.component').then((m) => m.BlogComponent)
    },
    {
        path: "privacy", 
        loadComponent: () => import('./privacy/privacy.component').then((m) => m.PrivacyComponent)
    }
];
