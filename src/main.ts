import { NestFactory } from '@nestjs/core';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import { AppModule } from './app.module';
import { json, urlencoded } from 'express'; 

async function bootstrap() {
    const app = await NestFactory.create(AppModule)
    app.use(json({ limit: '50mb' }));
    app.use(urlencoded({ extended: true, limit: '50mb' })) 
    if (process.env.NODE_ENV === 'development') app.enableCors()

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
