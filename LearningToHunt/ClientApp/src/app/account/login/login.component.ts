import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { first } from 'rxjs/operators';
import {NgIf, NgClass} from '@angular/common';

import { AccountService } from '../../_services/account.service';
import { AlertService } from '../../_services/alert.service';
import { HttpRequestStatus } from '@app/_models/http-request-status';
import { User } from '@app/_models/user';
import { HttpErrorResponse } from '@angular/common/http';

@Component({ 
  imports: [FormsModule, ReactiveFormsModule, NgIf, NgClass],
  templateUrl: 'login.component.html' 
})
export class LoginComponent implements OnInit {
  form!: FormGroup;
  status = HttpRequestStatus.NotSent;
  submitted = false;

  constructor(
    private formBuilder: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private accountService: AccountService,
    private alertService: AlertService
  ) { }

  ngOnInit() {
    this.form = this.formBuilder.group({
      email: ['', Validators.required],
      password: ['', Validators.required]
    });
  }

  // convenience getters for easy access to form fields
  get email() {    
    return this.form.get('email');
  }
  get password() {    
    return this.form.get('password');
  }
  
  // convenience method to determine if the component is working
  get loading() {
    return this.status === HttpRequestStatus.InProgress;
  }

  onSubmit() {
    this.submitted = true;

    // reset alerts on submit
    this.alertService.clear();

    // stop here if form is invalid
    if (this.form.invalid) {
      return;
    }

    this.status = HttpRequestStatus.InProgress;
    this.accountService.login(this.email?.value, this.password?.value)
      .pipe(first())
      .subscribe({
        next: (user) => {
          this.status = HttpRequestStatus.Successful;
          // get return url from query parameters or default to home page
          const returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
          this.router.navigateByUrl(returnUrl);
        },
        error: error => {
          this.status = HttpRequestStatus.Failed;
          this.alertService.error(this.inferErrorMessage(error));
        }
      });
  }

  inferErrorMessage(errResponse: HttpErrorResponse): string {
    let message = "";
    
    if (errResponse.status == 401) {
      message = "Email and/or password are invalid."
    } else {
      message = "An error has occurred.  Please try again later."
    }

    return message;
  }
}