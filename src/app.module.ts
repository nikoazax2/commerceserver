import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './users/users.module';
import { User } from './users/entities/user.entity';
import { Product } from './products/entities/products.entity';
import { ProductModule } from './products/products.module';
import { Categorie } from './categories/entities/categories.entity';
import { CategorieModule } from './categories/categories.module';
import { Cart } from './cart/entities/cart.entity';
import { CartModule } from './cart/cart.module';
import { UsersService } from './users/users.service';
import { AuthModule } from './auth/auth.module';
import { Variation } from './variation/entities/variations.entity';
import { VariationModule } from './variation/variations.module';

@Module({
    imports: [
        TypeOrmModule.forRoot({
            type: 'postgres',
            host: 'localhost',
            port: 5432,
            password: 'postgres',
            username: 'postgres',
            entities: [User, Product, Categorie, Cart, Variation],
            database: 'postgres',
            synchronize: true,
            logging: true,
        }),
        UsersModule,
        ProductModule,
        VariationModule,
        CartModule,
        CategorieModule,
        AuthModule,
    ],
    controllers: [AppController],
    providers: [AppService],
})
export class AppModule { }