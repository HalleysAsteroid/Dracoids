import { Component, OnInit } from '@angular/core';
import { AppComponent } from '../app.component';
import { ApiService } from '../api.service';

@Component({
  selector: 'app-approaches',
  templateUrl: './approaches.component.html',
  styleUrls: ['./approaches.component.css']
})
export class ApproachesComponent implements OnInit {
  title = 'frontEnd';
  strApproaches: any;
  dexApproaches: any;
  conApproaches: any;
  intApproaches: any;
  wisApproaches: any;
  chaApproaches: any;
  constructor(public apiService: ApiService) { };
  ngOnInit() {
    this.apiService.getMessage('approachNames/Strength').subscribe(data => {
      this.strApproaches = data;
    });
    this.apiService.getMessage('approachNames/Dexterity').subscribe(data => {
      this.dexApproaches = data;
    });
    this.apiService.getMessage('approachNames/Constitution').subscribe(data => {
      this.conApproaches = data;
    });
    this.apiService.getMessage('approachNames/Intelligence').subscribe(data => {
      this.intApproaches = data;
    });
    this.apiService.getMessage('approachNames/Wisdom').subscribe(data => {
      this.wisApproaches = data;
    });
    this.apiService.getMessage('approachNames/Charisma').subscribe(data => {
      this.chaApproaches = data;
    });
  }
}

