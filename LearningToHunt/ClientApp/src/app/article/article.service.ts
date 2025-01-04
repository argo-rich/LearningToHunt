//default
import { Injectable } from '@angular/core';

// added
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Article } from '../models/article';

@Injectable({
  providedIn: 'root'
})
export class ArticleService {

  private apiURL = "https://localhost:7000/article/";

  constructor(private http: HttpClient) { }

  getArticle(id: number): Observable<Article> {
    return this.http.get<Article>(this.apiURL + id);
  }
}
