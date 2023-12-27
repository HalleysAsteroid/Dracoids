import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { NavbarComponent } from './navbar/navbar.component';
import { HomeComponent } from './home/home.component';
import { AppRoutingModule } from './app-routing.module';
import { ApproachesComponent } from './approaches/approaches.component';
import { HttpClientModule } from '@angular/common/http';
import { ApproachInfoComponent } from './approach-info/approach-info.component';
import { CharacterCreatorComponent } from './character-creator/character-creator.component';

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    HomeComponent,
    ApproachesComponent,
    ApproachInfoComponent,
    CharacterCreatorComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
