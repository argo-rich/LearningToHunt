// default
import { Routes } from '@angular/router';

// added

export const routes: Routes = [
    {
        path: '',
        loadComponent: () => import('./home/home.component').then((m) => m.HomeComponent) 
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
        path: "account/register", 
        loadComponent: () => import('./account/register/register.component').then((m) => m.RegisterComponent)
    },
    {
        path: "account/confirmation/:confirmationStatus", 
        loadComponent: () => import('./account/confirmation/confirmation.component').then((m) => m.ConfirmationComponent)
    },
    {
        path: "account/login", 
        loadComponent: () => import('./account/login/login.component').then((m) => m.LoginComponent)
    },
    {
        path: "account/update", 
        loadComponent: () => import('./account/update-account/update-account.component').then((m) => m.UpdateAccountComponent)
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
