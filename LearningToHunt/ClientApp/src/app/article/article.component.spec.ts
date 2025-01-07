import { ComponentFixture, TestBed } from '@angular/core/testing';
import { ArticleComponent } from './article.component';

// added imports
import { provideHttpClient } from "@angular/common/http";
import { ActivatedRoute, convertToParamMap, provideRouter } from '@angular/router';
import { ArticleService } from './article.service';
import { of } from 'rxjs';
import { Observable } from 'rxjs';
import { Article } from '../models/article';

let article1: Article = {
  articleId: 1,
  title: "Test Blog Title",
  subtitle: "First Blog Subtitle",
  content: "Test blog content.",
  authorId: 1,
  createDate: new Date("2025-01-06T13:30:49"),
  modifyDate: new Date("2025-01-06T13:30:49")
};

let article2: Article = {
  articleId: 2,
  title: "Test Blog Title2",
  subtitle: "First Blog Subtitle2",
  content: "Test blog content2.",
  authorId: 2,
  createDate: new Date("2025-02-06T13:30:49"),
  modifyDate: new Date("2025-02-06T13:30:49")
};

// Mock ArticleService
class MockArticleService {
  getArticle(id: number): Observable<Article> {    
    return of((id === 1) ? article1 : article2);
  }
}

// Mock ActivatedRoute
const mockActivatedRoute = {
  snapshot: { 
    paramMap: {
      get(id: string): string {        
        return '1';
      }
    }
  }
};

describe('ArticleComponent', () => {
  let component: ArticleComponent;
  let fixture: ComponentFixture<ArticleComponent>;
  let articleService: ArticleService;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ArticleComponent],
      providers: [
        { provide: ArticleService, useClass: MockArticleService },
        { provide: ActivatedRoute, useValue: mockActivatedRoute },
        provideHttpClient()
      ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ArticleComponent);
    component = fixture.componentInstance;
    articleService = TestBed.inject(ArticleService);

    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
  
  it('init should retreive article1 from ArticleService', () => {
    expect(component.article).toBe(article1);
  });

  it('should retreive article2 from ArticleService', () => {
    component.getArticle(2);
    expect(component.article).toBe(article2);
  });

});
