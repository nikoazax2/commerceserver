import {
    Controller,
    Get,
    Post,
    Body,
    Patch,
    Param,
    Delete,
    UseInterceptors,
    UploadedFile,
    HttpException,
    UploadedFiles,
} from '@nestjs/common';
import { MailService } from './mails.service';
import * as fs from 'fs';
import { v4 as uuidv4 } from 'uuid';
import { FileInterceptor, FilesInterceptor } from '@nestjs/platform-express';
import { extname } from 'path';
import { diskStorage } from 'multer';
import { log } from 'console';


/**
 * whatever the string pass in controller decorator it will be appended to
 * API URL. to call any API from this controller you need to add prefix which is
 * passed in controller decorator.
 * in our case our base URL is http://localhost:3000/Mail
 */


@Controller('Mail')
export class MailController {
    constructor(private readonly MailService: MailService) { }

    @Post()
    create(@Body() createMailDto: any) {
        return this.MailService.sendMail(createMailDto)
    }

    @Post('sendCode')
    resetCode(@Body() createMailDto: any) {
        return this.MailService.sendCode(createMailDto)
    }

    //verifCode
    @Post('verifCode')
    verifCode(@Body() createMailDto: any) {
        return this.MailService.verifCode(createMailDto)
    }

}