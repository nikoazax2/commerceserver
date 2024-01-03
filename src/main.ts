import { NestFactory } from '@nestjs/core';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import { AppModule } from './app.module';
import { json, urlencoded } from 'express';
const helmet = require('helmet');
import * as fs from 'fs';
import * as https from 'https';

async function bootstrap() {
    const httpsOptions = {
        key: fs.readFileSync('./certificates/key.pem'),
        cert: fs.readFileSync('./certificates/cert.pem'),
    };
    const app = await NestFactory.create(AppModule, { httpsOptions });

    app.use(helmet())
    app.enableCors()

    app.enableCors({
        origin: ['http://localhost:8080', 'http://89.116.228.185', 'https://89.116.228.185', 'https://sagenicolas.fr', 'http://89.116.228.185/commerceclient/'],
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
