import { Module } from '@nestjs/common';
import { BlocService } from './bloc.service';
import { BlocController } from './bloc.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Bloc } from './entities/blocs.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Bloc])],
  controllers: [BlocController],
  providers: [BlocService],
})
export class BlocModule {}