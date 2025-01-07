// default
import { Routes } from '@angular/router';

// added
import { WeatherForecastComponent } from './weather-forecast/weather-forecast.component';
import { PrivacyComponent } from './privacy/privacy.component';
import { ArticleComponent } from './article/article.component';
import { BlogComponent } from './blog/blog.component';

export const routes: Routes = [
    {path: "", component: BlogComponent},
    {path: "blog/:blogId", component: BlogComponent},
    {path: "blog", component: BlogComponent},
    {path: "blogs", component: BlogComponent},
    {path: "weather-forecast", component: WeatherForecastComponent},
    {path: "article/:articleId", component: ArticleComponent},
    {path: "article", component: ArticleComponent},
    {path: "articles", component: ArticleComponent},
    {path: "privacy", component: PrivacyComponent}
];
