// default
import { Routes } from '@angular/router';

// added
import { WeatherForecastComponent } from './weather-forecast/weather-forecast.component';
import { PrivacyComponent } from './privacy/privacy.component';

export const routes: Routes = [
    {path: "", component: WeatherForecastComponent},
    {path: "weather-forecast", component: WeatherForecastComponent},
    {path: "privacy", component: PrivacyComponent}
];
