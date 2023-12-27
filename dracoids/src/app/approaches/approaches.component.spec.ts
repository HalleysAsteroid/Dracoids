import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ApproachesComponent } from './approaches.component';

describe('ApproachesComponent', () => {
  let component: ApproachesComponent;
  let fixture: ComponentFixture<ApproachesComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ApproachesComponent]
    });
    fixture = TestBed.createComponent(ApproachesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
