//default
import { Component, OnInit } from '@angular/core';

//added
import { Article } from '../models/article';
import { ArticleService } from './article.service';
import { Observable } from 'rxjs';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-article',
  imports: [],
  templateUrl: './article.component.html',
  styleUrl: './article.component.css'
})
export class ArticleComponent implements OnInit {

  article: Article = {
    "articleId": 0,
    "title": "",
    "subtitle": "",
    "content": "",
    "authorId": 0,
    "createDate": new Date(),
    "modifyDate": new Date()
  }

  constructor(
    private articleService: ArticleService,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    const articleId = parseInt(this.route.snapshot.paramMap.get('articleId') || "0");
    if (articleId !== 0) {
      this.getArticle(articleId);
    }
  }

  getArticle(articleId: number) {
    this.articleService.getArticle(articleId).subscribe(article => {
      this.article = article;
    });
  }
}
