import { TestBed } from '@angular/core/testing';
import { Observable } from 'rxjs';
import { BasketService } from './basket.service';

describe('BasketService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: BasketService = TestBed.get(BasketService);
    expect(service).toBeTruthy();
  });
});
