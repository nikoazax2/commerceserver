import { Test, TestingModule } from '@nestjs/testing';
import { ContenuController } from './contenu.controller';
import { ContenuService } from './contenu.service';

describe('ContenuController', () => {
  let controller: ContenuController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ContenuController],
      providers: [ContenuService],
    }).compile();

    controller = module.get<ContenuController>(ContenuController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
