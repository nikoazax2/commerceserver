import { Module } from '@nestjs/common';
import { MailService } from './mails.service';
import { MailController } from './mails.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Mail } from './entities/mails.entity';
import { AuthModule } from '../auth/auth.module'; 



@Module({
    imports: [TypeOrmModule.forFeature([Mail]), AuthModule],
    controllers: [MailController],
    providers: [MailService],
})
export class MailModule { }