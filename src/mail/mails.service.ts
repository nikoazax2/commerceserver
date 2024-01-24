import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { MailerService } from '@nestjs-modules/mailer';
import { Mail } from './entities/mails.entity';

@Injectable()
export class MailService {
    constructor(
        private readonly mailerService: MailerService,
        @InjectRepository(Mail) private readonly mailRepository: Repository<Mail>,
    ) { }


    public sendMail(createMailDto: any): void {
        this.mailerService
            .sendMail({
                to: 'webmaster@sagenicolas.fr', // list of receivers
                from: 'webmaster@sagenicolas.fr', // sender address
                subject: 'Testing Nest MailerModule ✔', // Subject line
                text: 'welcome', // plaintext body
                html: '<b>welcome</b>', // HTML body content
            })
            .then(() => { })
            .catch(() => { });
    }

    public async sendCode(createMailDto: any): Promise<void> {
        const entityManager = this.mailRepository.manager;
        //random 6 digit code in  string
        const code = Math.floor(100000 + Math.random() * 900000).toString();

        const result = await entityManager.query(`UPDATE public.user SET code = $1 WHERE email = $2;`, [code, createMailDto.email]);
        this.mailerService
            .sendMail({
                to: createMailDto.email,
                from: 'webmaster@sagenicolas.fr',
                subject: 'Code de vérification',
                text: ``,
                html: `The code is ${code}`,
            })
            .then(() => { })
            .catch(() => { });
    }

    public async verifCode(createMailDto: any): Promise<void> {
        const entityManager = this.mailRepository.manager;
        //get code of mail
        const code = await entityManager.query(`SELECT code FROM public.user WHERE email = $1;`, [createMailDto.email]);
        console.log(code[0].code);

        //compare code
        if (code[0].code == createMailDto.code) {
            const result = await entityManager.query(`UPDATE public.user SET activated = true WHERE email = $1;`, [createMailDto.email]);
        }
    }
}