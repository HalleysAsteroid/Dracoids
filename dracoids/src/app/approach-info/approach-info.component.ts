import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { ActivatedRoute, ParamMap } from '@angular/router';

@Component({
  selector: 'app-approach-info',
  templateUrl: './approach-info.component.html',
  styleUrls: ['./approach-info.component.css']
})
export class ApproachInfoComponent implements OnInit {
  currentApproach!: string
  title = 'frontEnd';
  approach: any;
  perks: any;
  soulabilities: any;
  constructor(public apiService: ApiService, private route: ActivatedRoute) {
    this.route.params.subscribe(params => console.log(params))
  };
  ngOnInit() {
    this.route.paramMap.subscribe((params: ParamMap) => {
      this.currentApproach = params.get('currentApproach')!.toString();
    });
    this.apiService.getMessage('approaches/' + this.currentApproach).subscribe(data => {
      this.approach = data;
    });
    this.apiService.getMessage('soulabilities/' + this.currentApproach).subscribe(data => {
      this.soulabilities = data;
    });
    this.apiService.getMessage('perks/' + this.currentApproach).subscribe(data => {
      this.perks = data;
    });
  }
}