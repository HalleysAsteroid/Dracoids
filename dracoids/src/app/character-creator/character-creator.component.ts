import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-character-creator',
  templateUrl: './character-creator.component.html',
  styleUrls: ['./character-creator.component.css']
})
export class CharacterCreatorComponent implements OnInit {
  dracoDB: any;
  approachList: any;
  kinsList: any;
  factionList: any;
  charSheetForm = this.formBuilder.group({
    'primary-approach': '',
    'secondary-approach': '',
    kin: '',
    'strength-score': 0,
    'dexterity-score': 0,
    'constitution-score': 0,
    'intelligence-score': 0,
    'wisdom-score': 0,
    'charisma-score': 0,
    'faction-tier': '',
    name: ''
  })
  constructor(public apiService: ApiService, private formBuilder: FormBuilder) {
  };
  ngOnInit() {
    this.apiService.getMessage('approachNames/list').subscribe(data => {
      this.approachList = data;
    });
    this.apiService.getMessage('kinNames/list').subscribe(data => {
      this.kinsList = data;
    });
    this.apiService.getMessage('factionTierNames/list').subscribe(data => {
      this.factionList = data;
    });
    this.apiService.getMessage('').subscribe(data => {
      this.dracoDB = data;
    });
  }
  onSubmit(): void {
    console.log('test')
  }
}