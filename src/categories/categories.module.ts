import { Module } from '@nestjs/common';
import { CategorieService } from './categories.service';
import { CategorieController } from './categories.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Categorie } from './entities/categories.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Categorie])],
  controllers: [CategorieController],
  providers: [CategorieService],
})
export class CategorieModule {}