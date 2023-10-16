import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsersModule } from './users/users.module';
import { User } from './users/entities/user.entity';
import { Product } from './products/entities/products.entity';
import { ProductModule } from './products/products.module';
import { AuthModule } from './auth/auth.module';

@Module({
    imports: [
        TypeOrmModule.forRoot({
            type: 'postgres',
            host: 'localhost',
            port: 5432,
            password: 'postgres',
            username: 'postgres',
            entities: [User, Product],
            database: 'postgres',
            synchronize: true,
            logging: true,
        }),
        UsersModule,
        ProductModule,
        AuthModule,
    ],
    controllers: [AppController],
    providers: [AppService],
})
export class AppModule { }