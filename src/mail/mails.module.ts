import { Module } from '@nestjs/common';
import { MailService } from './mails.service';
import { MailController } from './mails.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Mail } from './entities/mails.entity';

@Module({
    imports: [TypeOrmModule.forFeature([Mail])],
    controllers: [MailController],
    providers: [MailService],
})
export class MailModule { }