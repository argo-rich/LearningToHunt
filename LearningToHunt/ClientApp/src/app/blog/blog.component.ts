//default
import { Component, OnInit } from '@angular/core';

//added
import { Blog } from '../_models/blog';
import { BlogService } from '../_services/blog.service';
import { Observable } from 'rxjs';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-blog',
  imports: [],
  templateUrl: './blog.component.html',
  styleUrl: './blog.component.css'
})
export class BlogComponent implements OnInit {
blog: Blog = {
    "blogId": 0,
    "title": "",
    "subtitle": "",
    "content": "",
    "authorId": 0,
    "createDate": new Date(),
    "modifyDate": new Date()
  }

  constructor(
    private blogService: BlogService,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    const blogId = parseInt(this.route.snapshot.paramMap.get('blogId') || "0");
    if (blogId !== 0) {
      this.getBlog(blogId);
    }
  }

  getBlog(blogId: number): void {
    this.blogService.getBlog(blogId).subscribe(blog => {
      this.blog = blog;
    });
  }
}
