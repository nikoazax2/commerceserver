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
import { Contenu } from './contenu/entities/contenu.entity';
import { ContenuModule } from './contenu/contenu.module';
import { Commande } from './commandes/entities/commandes.entity';
import { CommandeModule } from './commandes/commandes.module';
import { StripeModule } from '@golevelup/nestjs-stripe';

@Module({
    imports: [
        TypeOrmModule.forRoot({
            type: 'postgres',
            host: 'localhost',
            port: 5432,
            password: 'postgres',
            username: 'postgres',
            entities: [User, Product, Categorie, Cart, Variation, Contenu, Commande],
            database: 'postgres',
            synchronize: true,
            logging: true,
        }),
        StripeModule.forRoot(StripeModule, {
            apiKey: 'pk_test_51NboKUBTmmLQabfnwQKPey7xyIrmAhFXWhRhcrhnrlylOrlvZdT4R5xsa4XDvRLNhFnOI9UadFgaLMoeaNQvcXex00SvCHyjK7',
            webhookConfig: {
                stripeSecrets: {
                    account: 'abc',
                    connect: 'cba',
                },
            },
        }),
        UsersModule,
        ProductModule,
        VariationModule,
        CartModule,
        CategorieModule,
        AuthModule,
        ContenuModule,
        CommandeModule
    ],
    controllers: [AppController],
    providers: [AppService],
})
export class AppModule { }