import {
    Controller,
    Get,
    Post,
    Body,
    Patch,
    UseInterceptors,
    Param,
    HttpException,
    UploadedFiles,
    Delete,
    UseGuards,
} from '@nestjs/common';
import { FileInterceptor, FilesInterceptor } from '@nestjs/platform-express';
import * as fs from 'fs';
import { BlocService } from './bloc.service';
import { CreateBlocDto } from './dto/create-blocs.dto';
import { UpdateBlocDto } from './dto/update-blocs.dto';
import { diskStorage } from 'multer';
import { Roles } from 'src/auth/decorators/roles.decorator';
import { Role } from 'src/auth/enums/role.enum';
import { RolesGuard } from 'src/auth/role.guard';
import { AuthGuard } from 'src/auth/auth.guard';
import { AuthUser } from 'src/auth/decorators/user.decorator';

/**
 * whatever the string pass in controller decorator it will be appended to
 * API URL. to call any API from this controller you need to add prefix which is
 * passed in controller decorator.
 * in our case our base URL is http://localhost:3000/Bloc
 */
@Controller('Bloc')
export class BlocController {
    constructor(private readonly BlocService: BlocService) { }

    /**
     * we have used get decorator to get all the Bloc's list
     * so the API URL will be
     * GET http://localhost:3000/Bloc
     */
    @Get()
    findAll() {
        return this.BlocService.findAllBloc();
    }

    /**
     * we have used get decorator with id param to get id from request
     * so the API URL will be
     * GET http://localhost:3000/Bloc/:id
     */
    @Get(':uuid')
    findOne(@Param('uuid') uuid: string) {
        return this.BlocService.viewBloc(uuid);
    }

    /**
     * we have used patch decorator with id param to get id from request
     * so the API URL will be
     * PATCH http://localhost:3000/Bloc/:id
     */
    @Patch(':uuid')
    @UseGuards(AuthGuard)
    update(@Param('uuid') uuid: string, @Body() updateBlocDto: UpdateBlocDto) {
        return this.BlocService.updateBloc(uuid, updateBlocDto);
    }

    /**
     * we have used Delete decorator with id param to get id from request
     * so the API URL will be
     * DELETE http://localhost:3000/Bloc/:id
     */
    @Delete(':uuid')
    @UseGuards(AuthGuard)
    remove(@Param('uuid') uuid: string) {
        return this.BlocService.removeBloc(uuid);
    }
}