import {
    Controller,
    Get,
    Post,
    Body,
    Patch,
    Param,
    Delete,
    UseGuards,
} from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { AuthGuard } from 'src/auth/auth.guard';
import { JwtService } from '@nestjs/jwt';
import { Headers } from '@nestjs/common';


/**
 * whatever the string pass in controller decorator it will be appended to
 * API URL. to call any API from this controller you need to add prefix which is
 * passed in controller decorator.
 * in our case our base URL is http://localhost:3000/user
 */
@Controller('user')
export class UserController {
    constructor(private readonly UsersService: UsersService, private jwtService: JwtService) { }

    /**
     * Post decorator represents method of request as we have used post decorator the method
     * of this API will be post.
     * so the API URL to create User will be
     * POST http://localhost:3000/user
     */
    @Post()
    create(@Body() createUserDto: CreateUserDto) {
        return this.UsersService.createUser(createUserDto);
    }

    /**
     * we have used get decorator to get all the user's list
     * so the API URL will be
     * GET http://localhost:3000/user
     */
    @Get()
    findAll(@Headers('Authorization') token: string) {
        let user = this.jwtService.decode(token.replace('Bearer ', ''))
        if (user['role'] === 1) {
            return this.UsersService.findAllUser();
        } else {
            return this.UsersService.viewUser(user['uuid']);
        }
        //return this.UsersService.findAllUser();
    }

    /**
     * we have used get decorator with id param to get id from request
     * so the API URL will be
     * GET http://localhost:3000/user/:id
     */
    @UseGuards(AuthGuard)
    @Get(':uuid')
    async findOne(@Headers('Authorization') token: string) {
        let uuid = await this.jwtService.decode(token.replace('Bearer ', ''))
        uuid = uuid['uuid']
        return this.UsersService.viewUser(uuid);
    }

    @UseGuards(AuthGuard)
    @Patch('nouveauMDP')
    updateMDP(@Body() body: any, @Headers('Authorization') token: string) {
        let user = this.jwtService.decode(token.replace('Bearer ', ''))
        return this.UsersService.updateMDP(user, body.password);
    }

    /**
     * we have used patch decorator with id param to get id from request
     * so the API URL will be
     * PATCH http://localhost:3000/user/:id
     */
    @UseGuards(AuthGuard)
    @Patch(':uuid')
    update(@Param('uuid') uuid: string, @Body() updateUserDto: UpdateUserDto, @Headers('Authorization') token: string) {
        let user = this.jwtService.decode(token.replace('Bearer ', ''))
        return this.UsersService.updateUser(uuid, updateUserDto);
    }

    /**
     * we have used Delete decorator with id param to get id from request
     * so the API URL will be
     * DELETE http://localhost:3000/user/:id
     */
    @Delete(':uuid')
    remove(@Param('uuid') uuid: string) {
        return this.UsersService.removeUser(uuid);
    }
}