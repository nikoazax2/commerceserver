import { Module } from '@nestjs/common';
import { VariationService } from './variations.service';
import { VariationController } from './variations.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Variation } from './entities/variations.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Variation])],
  controllers: [VariationController],
  providers: [VariationService],
})
export class VariationModule {}