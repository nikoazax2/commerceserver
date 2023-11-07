import { Test, TestingModule } from '@nestjs/testing';
import { CategorieController } from './categories.controller';
import { CategorieService } from './categories.service';

describe('CategorieController', () => {
  let controller: CategorieController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [CategorieController],
      providers: [CategorieService],
    }).compile();

    controller = module.get<CategorieController>(CategorieController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
