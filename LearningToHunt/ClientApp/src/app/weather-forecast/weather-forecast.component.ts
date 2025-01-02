// default (OnInit was added automatically)
import { Component, OnInit } from '@angular/core';

// added
import { WeatherForecast } from '../models/weather-forecast';
import { ForecastService } from './forecast.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-weather-forecast',
  imports: [CommonModule],
  templateUrl: './weather-forecast.component.html',
  styleUrl: './weather-forecast.component.css',
  standalone: true
})
export class WeatherForecastComponent implements OnInit {

  forecasts: WeatherForecast[] = [];

  constructor(private forecastService: ForecastService) {}

  ngOnInit(): void {
    this.forecastService.getForecasts().subscribe(forecasts => {
      this.forecasts = forecasts;
    });
  }  

}
