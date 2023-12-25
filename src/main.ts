import { NestFactory } from '@nestjs/core';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import { AppModule } from './app.module';
import { json, urlencoded } from 'express';
import * as fs from 'fs';
import * as https from 'https';

async function bootstrap() {
    const httpsOptions = {
        key: fs.readFileSync('./keys/server.key'),
        cert: fs.readFileSync('./keys/server.cert'),
    };

    const app = await NestFactory.create(AppModule, { httpsOptions });
    app.enableCors({
        origin: 'https://89.116.228.185',
    })
    app.use(json({ limit: '50mb' }));
    app.use(urlencoded({ extended: true, limit: '50mb' }));
    const config = new DocumentBuilder()
        .setTitle('Ecommerce example')
        .setDescription('The ecommerce API control')
        .setVersion('1.0')
        .addTag('ecommerce')
        .build();
    const document = SwaggerModule.createDocument(app, config);
    SwaggerModule.setup('api', app, document);
    await app.listen(3000);
}
bootstrap();
