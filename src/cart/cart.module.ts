import { Module } from '@nestjs/common';
import { Cartervice } from './cart.service';
import { CartController } from './cart.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Cart } from './entities/cart.entity'; 

@Module({
    imports: [TypeOrmModule.forFeature([Cart])],
    controllers: [CartController],
    providers: [Cartervice],
    exports: [Cartervice],
})
export class CartModule { }