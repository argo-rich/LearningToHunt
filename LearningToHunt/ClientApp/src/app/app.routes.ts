// default
import { Routes } from '@angular/router';

// added
import { WeatherForecastComponent } from './weather-forecast/weather-forecast.component';
import { PrivacyComponent } from './privacy/privacy.component';
import { ArticleComponent } from './article/article.component';

export const routes: Routes = [
    {path: "", component: WeatherForecastComponent},    
    {path: "weather-forecast", component: WeatherForecastComponent},
    {path: "article/:articleId", component: ArticleComponent},
    {path: "article", component: ArticleComponent},
    {path: "privacy", component: PrivacyComponent}
];
