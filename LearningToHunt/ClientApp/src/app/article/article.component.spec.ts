import { ComponentFixture, TestBed } from '@angular/core/testing';
import { ArticleComponent } from './article.component';

// added imports
import { provideHttpClient } from "@angular/common/http";
import { ActivatedRoute, convertToParamMap, provideRouter } from '@angular/router';
import { ArticleService } from './article.service';
import { of } from 'rxjs';
import { Observable } from 'rxjs';
import { Article } from '../models/article';

let articleZero: Article = {
  articleId: 0,
  title: "",
  subtitle: "",
  content: "",
  authorId: 0,
  createDate: new Date("0000-00-00T00:00:00"),
  modifyDate: new Date("0000-00-00T00:00:00")
};

let articles = new Map<number, Article>([
  [1, {
    articleId: 1,
    title: "Test Blog Title",
    subtitle: "First Blog Subtitle",
    content: "Test blog content.",
    authorId: 1,
    createDate: new Date("2025-01-06T13:30:49"),
    modifyDate: new Date("2025-01-06T13:30:49")
  }],
  [2, {
    articleId: 2,
    title: "Test Blog Title2",
    subtitle: "First Blog Subtitle2",
    content: "Test blog content2.",
    authorId: 2,
    createDate: new Date("2025-02-06T13:30:49"),
    modifyDate: new Date("2025-02-06T13:30:49")
  }]
]);

// Mock ArticleService
class MockArticleService {
  getArticle(id: number): Observable<Article> {
    return of(articles.get(id) || articleZero);
  }

  updateArticle(id: number, updatedArticle: Article): Observable<void> {
    updatedArticle.articleId = id;
    articles.set(id, updatedArticle);
    return new Observable<void>();
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
    expect(component.article).toBe(articles.get(1) || articleZero);
  });

  it('should retreive article2 from ArticleService', () => {
    component.getArticle(2);
    expect(component.article).toBe(articles.get(2) || articleZero);
  });

  it('should update article1 via ArticleService', () => {
    component.articleForm.setValue({
        title: "Updated Title",
        subtitle: "Updated Subtitle",
        content: "Updated content."
    });
    component.updateArticle();
    expect(component.article).toBe(articles.get(1) || articleZero);
    expect(component.article.title).toBe("Updated Title");
    expect((articles.get(1) || articleZero).subtitle).toBe("Updated Subtitle");
  });

});
