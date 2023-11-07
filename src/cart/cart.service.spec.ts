import { Test, TestingModule } from '@nestjs/testing';
import { Cartervice } from './cart.service';

describe('Cartervice', () => {
  let service: Cartervice;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [Cartervice],
    }).compile();

    service = module.get<Cartervice>(Cartervice);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
