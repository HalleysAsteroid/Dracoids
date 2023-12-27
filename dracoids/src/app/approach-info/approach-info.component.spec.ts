import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ApproachInfoComponent } from './approach-info.component';

describe('ApproachInfoComponent', () => {
  let component: ApproachInfoComponent;
  let fixture: ComponentFixture<ApproachInfoComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ApproachInfoComponent]
    });
    fixture = TestBed.createComponent(ApproachInfoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
