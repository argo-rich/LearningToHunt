import { ComponentFixture, TestBed } from '@angular/core/testing';
import { AppComponent } from './app.component';

//added
import { provideRouter } from '@angular/router';
import { routes } from './app.routes';
import { HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject, Observable, of, throwError } from 'rxjs';
import { AccountService } from './_services/account.service';
import { User } from './_models/user';

const logoutError = new HttpErrorResponse({
  error: {
    "type": "https://tools.ietf.org/html/rfc9110#section-15.5.2",
    "title": "Unauthorized",
    "status": 401,
    "detail": "Failed"
  },
  headers: new HttpHeaders(),
  status: 401,
  statusText: "Unauthorized",
  url: "https://apiUrl.com/api/service"
});

class MockAccountService {
  private userSubject: BehaviorSubject<User | null>;
  public user: Observable<User | null>;
  
  constructor() {
        this.userSubject = new BehaviorSubject(JSON.parse(localStorage.getItem('user')!));
        this.user = this.userSubject.asObservable();
    }

  logout(): Observable<object> {
    return (true) ? of({}) : throwError(() => logoutError);
  }

  removeUser() {
    // remove user from local storage and set current user to null
    // localStorage.removeItem('user');
    // this.userSubject.next(null);
    // this.router.navigate(['/account/login']);
  }
}

describe('AppComponent', () => {
  let component: AppComponent;
  let fixture: ComponentFixture<AppComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AppComponent],
      providers: [
          provideRouter(routes),
          { provide: AccountService, useClass: MockAccountService }
        ]
    }).compileComponents();
    
    fixture = TestBed.createComponent(AppComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create the app', () => {
    const fixture = TestBed.createComponent(AppComponent);
    const app = fixture.componentInstance;
    expect(app).toBeTruthy();
  });

  it(`should have the 'ClientApp' title`, () => {
    const fixture = TestBed.createComponent(AppComponent);
    const app = fixture.componentInstance;
    expect(app.title).toEqual('ClientApp');
  });

  it('should render nav', () => {
    const fixture = TestBed.createComponent(AppComponent);
    fixture.detectChanges();
    const compiled = fixture.nativeElement as HTMLElement;
    expect(compiled.querySelector('header')).toBeTruthy();
  });

  it('should create the app', () => {
    // arrange

    // act
    component.logout();

    // assert
    expect(component.user).toBe(null);
  });
});
