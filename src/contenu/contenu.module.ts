import { Module } from '@nestjs/common';
import { ContenuService } from './contenu.service';
import { ContenuController } from './contenu.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Contenu } from './entities/contenu.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Contenu])],
  controllers: [ContenuController],
  providers: [ContenuService],
})
export class ContenuModule {}