import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { ApproachesComponent } from './approaches/approaches.component';
import { ApproachInfoComponent } from './approach-info/approach-info.component';
import { CharacterCreatorComponent } from './character-creator/character-creator.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'approaches', component: ApproachesComponent },
  { path: 'approaches/:currentApproach', component: ApproachInfoComponent },
  { path: 'characterCreator', component: CharacterCreatorComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }