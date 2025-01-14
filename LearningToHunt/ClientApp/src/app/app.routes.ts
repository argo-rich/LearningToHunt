// default
import { Routes } from '@angular/router';

// added
import { WeatherForecastComponent } from './weather-forecast/weather-forecast.component';
import { PrivacyComponent } from './privacy/privacy.component';
import { ArticleComponent } from './article/article.component';
import { BlogComponent } from './blog/blog.component';
import { HomeComponent } from './home/home.component';

export const routes: Routes = [
    {path: "", component: HomeComponent},
    {path: "blog/:blogId", component: BlogComponent},
    {path: "blog", component: BlogComponent},
    {path: "blogs", component: BlogComponent},
    {path: "weather-forecast", component: WeatherForecastComponent},
    {path: "article/:articleId", component: ArticleComponent},
    {path: "article", component: ArticleComponent},
    {path: "articles", component: ArticleComponent},
    {path: "privacy", component: PrivacyComponent}
];
