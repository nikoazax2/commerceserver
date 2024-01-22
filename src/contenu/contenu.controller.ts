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
import { ContenuService } from './contenu.service';
import { CreateContenuDto } from './dto/create-contenu.dto';
import { UpdateContenuDto } from './dto/update-contenu.dto';
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
 * in our case our base URL is http://localhost:3000/Contenu
 */
@Controller('Contenu')
export class ContenuController {
    constructor(private readonly ContenuService: ContenuService) { }

    /**
     * Post decorator represents method of request as we have used post decorator the method
     * of this API will be post.
     * so the API URL to create Contenu will be
     * POST http://localhost:3000/Contenu
     */
    @UseGuards(AuthGuard)
    @Post() 
    create(@Body() createContenuDto: CreateContenuDto) {
        return this.ContenuService.createContenu(createContenuDto);
    }

    @Post('uploadImage') 
    @UseInterceptors(FilesInterceptor('photos[]', 10, {
        dest: './uploadSite', storage: diskStorage({
            destination: './uploadSite',
            filename: (req, file, cb) => {
                const filename: string = file.originalname;
                return cb(null, filename);
            }
        })
    }))
    uploadMultiple(@UploadedFiles() files) {
        console.log(files);
    }

    /**
   * Delete image with uuid
  */
    @Delete('image/:uuid')
    @UseGuards(AuthGuard)
    deleteImage(@Param('uuid') uuid: string) {
        try {
            fs.unlinkSync(`./uploadSite/${uuid}`);
            return 'File deleted successfully';
        } catch (error) {
            throw new HttpException('File not found', 404);
        }
    }

    /**
* Get image with uuid
*/
    @Get('image/:uuid')
    getImage(@Param('uuid') uuid: string) {
        try {
            const file = fs.readFileSync(`./uploadSite/${uuid}`);
            const base64Image = file.toString();
            return base64Image;
        } catch (error) {
            throw new HttpException('File not found', 404);
        }
    }


    /**
     * we have used get decorator to get all the Contenu's list
     * so the API URL will be
     * GET http://localhost:3000/Contenu
     */
    @Get()
    findAll() {
        return this.ContenuService.findAllContenu();
    }

    /**
     * we have used get decorator with id param to get id from request
     * so the API URL will be
     * GET http://localhost:3000/Contenu/:id
     */
    @Get(':uuid')
    findOne(@Param('uuid') uuid: string) {
        return this.ContenuService.viewContenu(uuid);
    }

    /**
     * we have used patch decorator with id param to get id from request
     * so the API URL will be
     * PATCH http://localhost:3000/Contenu/:id
     */
    @Patch(':uuid')
    @UseGuards(AuthGuard)
    update(@Param('uuid') uuid: string, @Body() updateContenuDto: UpdateContenuDto) {
        return this.ContenuService.updateContenu(uuid, updateContenuDto);
    }

    /**
     * we have used Delete decorator with id param to get id from request
     * so the API URL will be
     * DELETE http://localhost:3000/Contenu/:id
     */
    @Delete(':uuid')
    @UseGuards(AuthGuard)
    remove(@Param('uuid') uuid: string) {
        return this.ContenuService.removeContenu(uuid);
    }
}