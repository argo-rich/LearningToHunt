import { Component } from '@angular/core';
import { RouterOutlet, RouterLink } from '@angular/router';
import { DatePipe } from '@angular/common';
import { AlertComponent } from './_components/alert.component';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet, RouterLink, DatePipe, AlertComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
  standalone: true
})
export class AppComponent {
  title = 'ClientApp';
  currDate = Date.now();
}
