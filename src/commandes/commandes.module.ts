import { Module } from '@nestjs/common';
import { CommandeService } from './commandes.service';
import { CommandeController } from './commandes.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Commande } from './entities/commandes.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Commande])],
  controllers: [CommandeController],
  providers: [CommandeService],
})
export class CommandeModule {}