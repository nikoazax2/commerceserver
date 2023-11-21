import { Test, TestingModule } from '@nestjs/testing';
import { VariationController } from './variations.controller';
import { VariationService } from './variations.service';

describe('VariationController', () => {
  let controller: VariationController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [VariationController],
      providers: [VariationService],
    }).compile();

    controller = module.get<VariationController>(VariationController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
