// default
import { Injectable } from '@angular/core';

// added
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { WeatherForecast } from '../models/weather-forecast';

@Injectable({
  providedIn: 'root'
})
export class ForecastService {

  private apiURL = "https://localhost:7000/weatherforecast/";

  constructor(private http: HttpClient) { }

  getForecasts(): Observable<WeatherForecast[]> {
    return this.http.get<WeatherForecast[]>(this.apiURL);
  }
}
