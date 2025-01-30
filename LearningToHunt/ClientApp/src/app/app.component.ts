import { Component } from '@angular/core';
import { RouterOutlet, RouterLink } from '@angular/router';
import { DatePipe, NgIf } from '@angular/common';
import { AlertComponent } from './_components/alert.component';
import { User } from './_models/user';
import { AccountService } from './_services/account.service';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, RouterLink, DatePipe, AlertComponent, NgIf],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
  standalone: true
})
export class AppComponent {
  title = 'ClientApp';
  currDate = Date.now();
  user?: User | null;

  constructor(private accountService: AccountService) {
    this.accountService.user.subscribe(u => this.user = u);
  }

  logout() {
    this.accountService.logout().subscribe({
      next: (user) => {
        this.accountService.removeUser();
      },
      error: error => {
          // Ff error.status === 401 it just means the user was already logged out on the server 
          // side.  Any other error is not good, but we still want to log the user out on the client side.
          this.accountService.removeUser();
      }
      
  });
  }
}
