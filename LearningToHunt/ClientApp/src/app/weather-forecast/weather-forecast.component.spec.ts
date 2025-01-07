//default
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { WeatherForecastComponent } from './weather-forecast.component';

// added imports
import { provideHttpClient } from "@angular/common/http";

describe('WeatherForecastComponent', () => {
  let component: WeatherForecastComponent;
  let fixture: ComponentFixture<WeatherForecastComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [WeatherForecastComponent],
      providers: [
          provideHttpClient()
      ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(WeatherForecastComponent);
    component = fixture.componentInstance;
    //fixture.detectChanges(); // commented out to not make http call during oninit
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
