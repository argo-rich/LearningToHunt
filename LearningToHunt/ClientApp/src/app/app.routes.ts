// default
import { Routes } from '@angular/router';

// added
import { WeatherForecastComponent } from './weather-forecast/weather-forecast.component';

export const routes: Routes = [
    {path: "", component: WeatherForecastComponent},
    {path: "weather-forecast", component: WeatherForecastComponent}
];
