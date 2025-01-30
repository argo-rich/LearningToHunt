import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, map, Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { User } from '../_models/user';

@Injectable({
  providedIn: 'root'
})
export class AccountService {
  private userSubject: BehaviorSubject<User | null>;
  public user: Observable<User | null>;

  constructor(
      private router: Router,
      private http: HttpClient
  ) {
      this.userSubject = new BehaviorSubject(JSON.parse(localStorage.getItem('user')!));
      this.user = this.userSubject.asObservable();
  }

  public get userValue() {
      return this.userSubject.value;
  }

  register(user: User): Observable<object> {
    return this.http.post(`${environment.apiBaseUrl}register`, user);
  }

  login(email: string, password: string): Observable<User> {
      return this.http.post<User>(`${environment.apiBaseUrl}api/account/login`, { email, password }, {withCredentials: true})
          .pipe(map(user => {
              // store user details in local storage to keep user logged in between page refreshes
              localStorage.setItem('user', JSON.stringify(user));
              this.userSubject.next(user);
              return user;
          }));
  }

  logout(): Observable<object> {
    return this.http.post(`${environment.apiBaseUrl}api/account/logout`, {}, {withCredentials: true});      
  }

  removeUser() {
    // remove user from local storage and set current user to null
    localStorage.removeItem('user');
    this.userSubject.next(null);
    this.router.navigate(['/account/login']);
  }
/*
  getAll() {
      return this.http.get<User[]>(`${environment.apiBaseUrl}/users`);
  }

  getById(id: string) {
      return this.http.get<User>(`${environment.apiBaseUrl}/users/${id}`);
  }

  update(id: string, params: any) {
      return this.http.put(`${environment.apiBaseUrl}/users/${id}`, params)
          .pipe(map(x => {
              // update stored user if the logged in user updated their own record
              if (id == this.userValue?.id) {
                  // update local storage
                  const user = { ...this.userValue, ...params };
                  localStorage.setItem('user', JSON.stringify(user));

                  // publish updated user to subscribers
                  this.userSubject.next(user);
              }
              return x;
          }));
  }

  delete(id: string) {
      return this.http.delete(`${environment.apiBaseUrl}/users/${id}`)
          .pipe(map(x => {
              // auto logout if the logged in user deleted their own record
              if (id == this.userValue?.id) {
                  this.logout();
              }
              return x;
          }));
  }
*/
}
