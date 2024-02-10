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
import { UsersService } from './users/users.service';
import { AuthModule } from './auth/auth.module';
import { Variation } from './variation/entities/variations.entity';
import { VariationModule } from './variation/variations.module';
import { Contenu } from './contenu/entities/contenu.entity';
import { ContenuModule } from './contenu/contenu.module';
import { Commande } from './commandes/entities/commandes.entity';
import { CommandeModule } from './commandes/commandes.module';
import { BlocModule } from './blocs/bloc.module';
import { Bloc } from './blocs/entities/blocs.entity'
import { MailerModule } from '@nestjs-modules/mailer';
import { PugAdapter } from '@nestjs-modules/mailer/dist/adapters/pug.adapter';
import { MailModule } from './mail/mails.module';
import { ConfigModule } from '@nestjs/config';
import * as dotenv from 'dotenv';
dotenv.config();

@Module({
    imports: [

        TypeOrmModule.forRoot({
            type: 'postgres',
            host: process.env.DB_HOST,
            port: Number(process.env.DB_PORT),
            username: process.env.DB_USERNAME,
            password: process.env.DB_PASSWORD,
            database: process.env.DB_NAME,
            entities: [User, Product, Categorie , Variation, Contenu, Commande, Bloc],
            synchronize: true,
            logging: true,
        }),
        UsersModule,
        ProductModule,
        VariationModule, 
        CategorieModule,
        AuthModule,
        ContenuModule,
        CommandeModule,
        BlocModule,
        MailerModule.forRoot({
            transport: `smtps://webmaster@sagenicolas.fr:${process.env.MDP_MAIL_SMTP}@smtp.hostinger.com`,
            defaults: {
                from: '"nest-modules" <modules@nestjs.com>',
            },
            template: {
                dir: __dirname + '/templates',
                adapter: new PugAdapter(),
                options: {
                    strict: true,
                },
            },
        }),
        MailerModule,
        MailModule
    ],
    controllers: [AppController],
    providers: [AppService],
})
export class AppModule { }