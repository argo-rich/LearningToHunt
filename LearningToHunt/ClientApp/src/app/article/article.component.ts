//default
import { Component, OnInit } from '@angular/core';

//added
import { Article } from '../models/article';
import { ArticleService } from './article.service';
import { ActivatedRoute } from '@angular/router';
import { FormsModule, ReactiveFormsModule, FormGroup, Validators, FormControl } from '@angular/forms';
import {NgIf} from '@angular/common';
import { AngularEditorModule } from '@kolkov/angular-editor';

@Component({
  selector: 'app-article',
  imports: [FormsModule, ReactiveFormsModule, NgIf, AngularEditorModule],
  templateUrl: './article.component.html',
  styleUrl: './article.component.css'
})

export class ArticleComponent implements OnInit {
  
  editMode: boolean = false;
  article: Article = {
    "articleId": 0,
    "title": "",
    "subtitle": "",
    "content": "",
    "authorId": 0,
    "createDate": new Date(),
    "modifyDate": new Date()
  }
  articleForm: FormGroup = new FormGroup({});

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

  get title() {
    return this.articleForm.get('title');
  }

  get subtitle() {
    return this.articleForm.get('subtitle');
  }

  get content() {
    return this.articleForm.get('content');
  }

  getArticle(articleId: number) {
    this.articleService.getArticle(articleId).subscribe(article => {
      this.article = article;
      
      this.articleForm = new FormGroup({
        title: new FormControl(this.article.title, [Validators.required, Validators.maxLength(25)]),
        subtitle: new FormControl(this.article.subtitle, [Validators.required, Validators.maxLength(35)]),
        content: new FormControl(this.article.content, [Validators.required])
      });
    });
  }

  updateArticle() {
    let id = parseInt(this.route.snapshot.paramMap.get('articleId') || "0");
    let article = this.articleForm.value;
    
    this.editMode = false;
    this.article.title = this.title?.value;
    this.article.subtitle = this.subtitle?.value;
    this.article.content = this.content?.value;
    this.articleService.updateArticle(id, this.article).subscribe(() => {
      console.log("Update request processed");
    });;
  }
}
