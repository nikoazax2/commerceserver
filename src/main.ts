import { NestFactory } from '@nestjs/core';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import { AppModule } from './app.module';

async function bootstrap() {
    const app = await NestFactory.create(AppModule);
    app.enableCors({
        origin: 'http://localhost:8080',
    })

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
