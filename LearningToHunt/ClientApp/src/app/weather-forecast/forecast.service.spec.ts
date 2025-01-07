import { TestBed } from '@angular/core/testing';
import { ForecastService } from './forecast.service';

// added imports
import { provideHttpClient } from "@angular/common/http";

describe('ForecastService', () => {
  let service: ForecastService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [
        provideHttpClient()
      ]
    });
    service = TestBed.inject(ForecastService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
